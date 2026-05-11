# Custom Chef Resource para gestionar archivos
# Nombre del recurso: chef_file_resource_0fae22a2edeb7e7a.rb

Chef.provides(:file_management) if respond_to?(:provides)

property :path, String, name_property: true, required: true
property :content, String, required: false
property :source, String, required: false
property :mode, String, default: '0644'
property :owner, String, default: 'root'
property :group, String, default: 'root'
property :backup, [Integer, FalseClass], default: 5
property :action_type, Symbol, equal_to: [:create, :delete, :touch], default: :create

load_current_value do |new_resource|
  if ::File.exist?(new_resource.path)
    current_value_does_not_exist! unless ::File.file?(new_resource.path)
    @content = ::File.read(new_resource.path)
    @mode = sprintf('%o', (::File.stat(new_resource.path).mode & 0777))
    @owner = Etc.getpwuid(::File.stat(new_resource.path).uid).name
    @group = Etc.getgrgid(::File.stat(new_resource.path).gid).name
  else
    current_value_does_not_exist!
  end
end

action :create do
  converge_if_changed do
    directory ::File.dirname(new_resource.path) do
      recursive true
      action :create
    end
    
    file new_resource.path do
      content new_resource.content
      source new_resource.source
      mode new_resource.mode
      owner new_resource.owner
      group new_resource.group
      backup new_resource.backup
      action :create
    end
  end
end

action :delete do
  converge_if_changed do
    file new_resource.path do
      action :delete
    end
  end
end

action :touch do
  converge_if_changed do
    execute "touch #{new_resource.path}" do
      command "touch #{new_resource.path}"
      creates new_resource.path
    end
  end
end

# Ejemplo de uso en una receta:
# file_management '/tmp/ejemplo.txt' do
#   content 'Hola Mundo desde Chef'
#   mode '0644'
#   owner 'root'
#   group 'root'
#   action :create
# end
