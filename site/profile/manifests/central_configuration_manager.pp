class profile::central_configuration_manager ($site_level_configuration_file = '/etc/lightweight-site/site_level_configuration.yaml'){
  file { 'site_level_configuration_file':
    path => $site_level_configuration_file,
    ensure => 'file',
    mode => '770',
    owner => 'admin'
  }
  
}
