class users {

package { 'httpd':
  ensure=> 'present',
  notify=> Service['httpd'],
}

service { ['httpd', 'php']:
  ensure => 'running',
  enable => true,
  require=> Package['httpd']
}

$users = {
  'user1'   =>  { uid => '1001', home  => '/var/www/user1', },
  'user2'   =>  { uid => '1002', home  => '/var/www/user2', },
  'user3'   =>  { uid => '1003', home  => '/var/www/user3', },
}

$homedir = {
  '/var/www/user1' => { owner => 'user1', group => 'user1', },
  '/var/www/user2' => { owner => 'user2', group => 'user2', },
  '/var/www/user3' => { owner => 'user3', group => 'user3', },
}

$user_defaults = {
   ensure      => 'present',
   managehome  => true,
}

$file_defaults = {
   ensure   => 'directory',
   mode      => '755',
   seltype  => 'user_home_dir_t',
   force    => true,
}
create_resources( user, $users, $user_defaults )
create_resources( file, $homedir, $file_defaults )
}
include users
