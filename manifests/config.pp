# Class: pakiti::config
#
# Class which configures the pakiti agent service
class pakiti::config {

  if $pakiti::client {
    file { '/etc/pakiti/pakiti2-client.conf':
      owner   => 'root',
      group   => 'root',
      mode    => '0640',
      content => template('pakiti/pakiti-client.conf.erb')
    }
  }

  if $pakiti::server {
    file { '/etc/pakiti/pakiti2-server.conf':
      owner   => 'root',
      group   => 'apache',
      mode    => '0640',
      content => template('pakiti/pakiti-server.conf.erb')
    }

    exec { 'fill-tables':
      command => "/usr/bin/mysql -u ${pakiti::server_username} -p${pakiti::server_password} -h ${pakiti::server_hostname} ${pakiti::server_dbname} < /usr/share/doc/pakiti-server-*/pakiti2.sql",
      onlyif  => "/usr/bin/mysql -u ${pakiti::server_username} -p${pakiti::server_password} -h ${pakiti::server_hostname} ${pakiti::server_dbname} -e=\"SELECT 1 FROM arch LIMIT 1;\""
    }
  }
}
