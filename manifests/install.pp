# Class: pakiti::install
#
# Installation of the pakiti package
class pakiti::install {

  if $pakiti::client {
    package { 'pakiti-client':
      ensure => $pakiti::client_ensure;
    }
  }

  if $pakiti::server {
    package { 'pakiti-server':
      ensure => 'installed';
    }
  }
  
  file { '/etc/pakiti':
    ensure => 'directory',
  }
}
