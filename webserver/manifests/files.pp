class webserver::files {
  file { '/var/www/html/index.html':
    ensure  => 'file',
    content => template('webserver/index.html.erb'),
    mode    => '0644',
    require => Package['httpd'],
  }
}