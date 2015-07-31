# == Class: motd
#
# Module to manage motd
#
class motd (
) {
      case $::role {
        'puppetmaster','vpn': {
          $banner = 'Puppet Master'
        }
        'webserver': {
          $banner = 'webserver'
        }
        'default': {
          fail("Node is <${::role}>.  I am only meant to work on puppetmasters and webservers.")
        }
      }
      file { '/etc/motd':
        ensure => file,
        content=> $banner,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
      }
}
