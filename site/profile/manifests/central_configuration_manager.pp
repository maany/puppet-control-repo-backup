class profile::central_configuration_manager ($site_level_configuration_file = '/etc/puppetlabs/code/environments/production/data/site_level_configuration.yaml'){
  notify {"Ready for YAML Processing from $site_level_configuration_file":}
  $data = loadyaml($site_level_configuration_file, {"default" => "failed"})
  $content = inline_template("
<%- require 'json' -%>
<%= JSON.pretty_generate(@data) %>
")
  notify {"$content" :}
}
