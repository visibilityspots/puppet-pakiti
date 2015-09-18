# Class: pakiti
#
# Initialization class for the pakiti service
class pakiti (
  $motd              = $pakiti::params::motd,

  $client            = $pakiti::params::client,
  $server            = $pakiti::params::server,

  $servers_name      = $pakiti::params::servers_name,
  $server_url        = $pakiti::params::server_url,
  $server_curl       = $pakiti::params::server_curl,
  $server_tag        = $pakiti::params::server_tag,

  $server_hostname   = $pakiti::params::server_hostname,
  $server_dbname     = $pakiti::params::server_dbname,
  $server_username   = $pakiti::params::server_username,
  $server_password   = $pakiti::params::server_password,

  $server_web_url    = $pakiti::params::server_web_url,
  $server_web_title  = $pakiti::params::server_web_title,
  $connection_method = $pakiti::params::connection_method,
  $client_ensure     = $pakiti::params::client_ensure,
) inherits pakiti::params {

  if $motd {
    motd::register{'pakiti':}
  }

  include pakiti::install
  include pakiti::config

  Class['pakiti::install'] ->
  Class['pakiti::config']
}
