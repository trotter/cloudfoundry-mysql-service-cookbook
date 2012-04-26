include_recipe "mysql::server"

package 'libcurl3'
package 'libcurl3-gnutls'
package 'libcurl4-openssl-dev'

package "sqlite3"
package "libsqlite3-ruby"
package "libsqlite3-dev"

cloudfoundry_component "mysql_node" do
  install_path File.join(node.cloudfoundry_common.vcap.install_path, "services", "mysql")
  bin_file     File.join(node.cloudfoundry_common.vcap.install_path, "bin", "services", "mysql_node")
  pid_file     node.cloudfoundry_mysql_service.node.pid_file
  log_file     node.cloudfoundry_mysql_service.node.log_file
end

directory node.cloudfoundry_mysql_service.node.base_dir do
  owner node.cloudfoundry_common.user
  mode  "0755"
end
