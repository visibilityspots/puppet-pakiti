# Class pakiti::params
#
# This class contains every parameter which will be used in this puppet module
# for setting up the pakiti agent
class pakiti::params {
  $motd             = false

  $server           = false
  $client           = true

  $servers_name     = 'pakiti.server.com:443'
  $server_url       = '/feed/'
  $server_curl      = 'curl'
  $server_tag       = $::environment

  $server_hostname  = 'localhost'
  $server_dbname    = 'pakiti'
  $server_username  = 'pakiti_server'
  $server_password  = 'mysql_password'

  $server_web_url   = 'https://pakiti.cern.ch'
  $server_web_title = 'My_Organization'
}
