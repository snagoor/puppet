class webserver::users::alice {
  user { 'alice':
    ensure     => 'present',
    home       => '/home/webmaster',
    shell      => '/bin/bash',
    managehome => true,
    password   => '$6$OgyOhwMFVUbH5iee$gOslfu4NhaTQ198vwleCoBrNOYCoYkQvpZX9YG8ymsGBANaSiUsaBCkjuDd4HyK6wsy7b0gZaH2qO/mBGS1.b/',
    require    => User['webmaster'],
  }
}