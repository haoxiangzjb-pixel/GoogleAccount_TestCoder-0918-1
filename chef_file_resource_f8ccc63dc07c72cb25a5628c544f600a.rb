#
# Cookbook:: custom_resources
# Resource:: file_manager
#
# Recurso personalizado de Chef para gestionar archivos
#

provides :file_manager

property :path, String, name_property: true, description: 'Ruta completa del archivo'
property :content, String, description: 'Contenido del archivo'
property :owner, String, default: 'root', description: 'Propietario del archivo'
property :group, String, default: 'root', description: 'Grupo del archivo'
property :mode, String, default: '0644', description: 'Permisos del archivo en formato octal'
property :backup_count, Integer, default: 5, description: 'Número de copias de seguridad a mantener'

action :create do
  directory ::File.dirname(new_resource.path) do
    recursive true
    action :create
  end

  file new_resource.path do
    content new_resource.content
    owner new_resource.owner
    group new_resource.group
    mode new_resource.mode
    backup new_resource.backup_count
    action :create
  end
end

action :delete do
  file new_resource.path do
    action :delete
  end
end

action :touch do
  directory ::File.dirname(new_resource.path) do
    recursive true
    action :create
  end

  execute "touch #{new_resource.path}" do
    command "touch #{new_resource.path}"
    creates new_resource.path
    action :run
  end
end

action :update do
  if ::File.exist?(new_resource.path)
    file new_resource.path do
      content new_resource.content if new_resource.content
      owner new_resource.owner
      group new_resource.group
      mode new_resource.mode
      backup new_resource.backup_count
      action :create
    end
  else
    Chef::Log.warn("El archivo #{new_resource.path} no existe para actualizar")
  end
end
