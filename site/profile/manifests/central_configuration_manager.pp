class profile::central_configuration_manager ($site_level_configuration_file = '/etc/puppetlabs/code/environments/production/data/site_level_configuration.yaml'){
  notify {"Ready for YAML Processing from $site_level_configuration_file":}
  $data = loadyaml($site_level_configuration_file, {"default" => "failed"})
  $content = inline_template("
<%- require 'json' -%>
<%= JSON.pretty_generate(@data) %>
")
  notify {"$content" :}

  file_line {"Modify Puppet.conf to enable custom ENC":
    path => '/etc/puppetlabs/puppet/puppet.conf',
    line => 'node_terminus = exec'
  }
  file_line {"Line 2":
    path => '/etc/puppetlabs/puppet/puppet.conf',
    line => 'external_nodes = /etc/puppetlabs/code/environments/production/data/puppet_node_classifier.py'
  }
  
}
