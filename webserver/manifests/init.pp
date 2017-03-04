# Class: webserver
#
# This module manages webserver
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class webserver {
  user { 'webmaster':
    ensure     => 'present',
    home       => '/home/webmaster',
    managehome => true,
    shell      => '/bin/bash',
    password   => '$6$OgyOhwMFVUbH5iee$gOslfu4NhaTQ198vwleCoBrNOYCoYkQvpZX9YG8ymsGBANaSiUsaBCkjuDd4HyK6wsy7b0gZaH2qO/mBGS1.b/',
  }

  package { 'httpd': ensure => 'present', }

  service { 'httpd':
    enable  => 'true',
    ensure  => 'running',
    require => Package['httpd'],
  }

  include webserver::files
  include webserver::users::alice
  include webserver::users::bob

}
