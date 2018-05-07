class profile::site_admin_action {
  notify { "environment is puppet:///site_level_configuration/": }
  file {'/etc/lightweight_site':
    ensure => 'directory',
    owner => 'admin',
    mode => '770'
  } 
  file {'/etc/lightweight_site/site_level_configuration.yaml':
    ensure => 'file',
    owner => 'admin',
    mode => '770',
    source => "puppet:///site_level_configuration/site_level_configuration.yaml",
  }
  #file {'/etc/lightweight_site/puppet_node_classifier.sh':
  #  ensure => 'file',
  #  owner => 'admin', 
  #  mode => '770',
  #  source => "puppet:///site_level_configuration/puppet_node_classifier.sh",
  #}
}
