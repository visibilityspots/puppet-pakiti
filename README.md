# puppet-pakiti module

[![Build Status](https://travis-ci.org/visibilityspots/puppet-pakiti.png)](https://travis-ci.org/visibilityspots/puppet-pakiti)

A puppet-module which configures the pakiti service (http://pakiti.sourceforge.net)

The pakiti packages needs to be uploaded to an avaible repository so the puppet module can install them

## Requirements

Tested on centos 6.5, ruby-1.8.x and puppet 3.4.x


The pakiti server needs a mysql database

you could use for example https://github.com/arioch/puppet-percona

## Options

```puppet
	$motd             = defaults to false,
	(enable when you use the puppet-motd module)

	$client           = defaults to true,
	$server           = defaults to false,

	[Client configuration]
	$servers_name     = the server to report to,
	$server_url       = url of pakiti script on server, defaults to /feed/,
	$server_curl	  = path to curl command,
	$server_tag       = the identifier,

	[Server configuration]
	$server_hostname  = database server hostname, defaults to localhost,
	$server_dbname    = database name, defaults to pakiti,
	$server_username  = database username, default to pakiti_server,
	$server_password  = database password, defaults to mysql_password,

	[Web interface]
	$server_web_url   = url of the local pakiti server,
	$server_web_title = the name of your organisation
```

## Server example
(in combination with the percona module)

```puppet
node 'pakiti-server' {
  class {
    'percona':
      server => true;

    'pakiti':
      server           => true,
      server_dbname    => 'pakiti2',
      server_username  => 'pakiti',
      server_password  => 'password',
      server_web_url   => $::fqdn,
      server_web_title => 'Pakiti service';
  }

  percona::database {
    'pakiti2':;
  }

  percona::rights {
    'pakiti@localhost/pakiti2':
      database => 'pakiti2',
      user     => 'pakiti',
      password => 'password',
      before   => Class['pakiti'];
  }
}
```

## Client example
```puppet
node 'pakiti-client' {
  include pakiti
}
```
