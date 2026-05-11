# Chef Recipe Template para gerar arquivos de configuração
# Este template usa o recurso 'template' do Chef para gerar arquivos de configuração dinamicamente

# Definição de variáveis de configuração
default_attributes = {
  'app_name' => 'my_application',
  'port' => 8080,
  'log_level' => 'info',
  'max_connections' => 100,
  'database' => {
    'host' => 'localhost',
    'port' => 5432,
    'name' => 'app_db'
  }
}

# Template para arquivo de configuração principal
template '/etc/myapp/config.yml' do
  source 'config.yml.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    app_name: default_attributes['app_name'],
    port: default_attributes['port'],
    log_level: default_attributes['log_level'],
    max_connections: default_attributes['max_connections']
  )
  action :create
end

# Template para arquivo de configuração do banco de dados
template '/etc/myapp/database.conf' do
  source 'database.conf.erb'
  owner 'root'
  group 'root'
  mode '0640'
  variables(
    db_host: default_attributes['database']['host'],
    db_port: default_attributes['database']['port'],
    db_name: default_attributes['database']['name']
  )
  action :create
end

# Template para arquivo de logging
template '/etc/myapp/logging.conf' do
  source 'logging.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    log_level: default_attributes['log_level'],
    app_name: default_attributes['app_name']
  )
  notifies :restart, 'service[myapp]', :delayed
  action :create
end

# Serviço da aplicação
service 'myapp' do
  action [:enable, :start]
end

# Exemplo de template ERB inline (para casos simples)
template '/etc/myapp/app.properties' do
  content <<-EOF
# Configuração gerada pelo Chef
app.name=<%= @app_name %>
app.port=<%= @port %>
app.environment=<%= node.chef_environment %>
app.hostname=<%= node.fqdn %>
  EOF
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    app_name: default_attributes['app_name'],
    port: default_attributes['port']
  )
  action :create
end
