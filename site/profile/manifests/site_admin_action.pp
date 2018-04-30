class profile::site_admin_action {
  file {'/etc/lightweight_site/site_level_configuration_file'
    source => 'puppet:///environments/$environment/data/site_level_configuration.yaml'
  }
}
