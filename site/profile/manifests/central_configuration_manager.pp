class profile::central_configuration_manager ($site_level_configuration_file = '/etc/puppetlabs/code/environments/production/data/site_level_configuration.yaml'){
  notify {"Ready for YAML Processing from $site_level_configuration_file":}
  ## Load YAML file ##
  $data = loadyaml($site_level_configuration_file, {"default" => "failed"})
  $content = inline_template("
  <%- require 'json' -%>
  <%= JSON.pretty_generate(@data) %>
  ")
  #notify {"$content" :}
  
  ##Extract repo in YAML file##
  #$ce_repo = inline_template("<%= @data[0][ce][1][repo]")
  notice ($data[0][ce][1][repo])
  $repo = $data[0][ce][1][repo]
  notice ($repo)

  ##set up git## 
  package {'git':
    ensure => installed,
  }
  ##wget repo and send it to client##
  vcsrepo {'/etc/lightweight-site':
    ensure => present,
    provider => git,
    source => "$repo"
  } 
 


  ## ENC on client test ##
  #file_line {"Modify puppet.conf: add node_terminus":
  #  path => '/etc/puppetlabs/puppet/puppet.conf',
  #  line => 'node_terminus = exec'
  #}
  #file_line {"Modify puppet.conf: specify ENC path":
  #  path => '/etc/puppetlabs/puppet/puppet.conf',
  #  line => 'external_nodes = /etc/lightweight_site/puppet_node_classifiers.sh'
  #}
  
}
