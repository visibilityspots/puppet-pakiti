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
  }
}
