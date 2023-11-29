#Installing packages using puppet

include nginx

package { 'nginx':
  ensure  => 'present',
  require => Apt['nginx'],
}
nginx::resource::server { '54.237.38.25':
  listen port => 80,
file { '/usr/share/nginx/html/index.html':
  ensure  => present,
  content => 'Hello World',
}

nginx::resource::location { '54.237.38.25/redirect_me/':
  ensure          => present,
  location        => '/redirect_me/',
  server          => '54.237.38.25',
  location_config => {
    'return => 301 https://open.spotify.com/track/6PwjKdyaavh0KaOsU6KKYJ?si=395f4c65e10b4772;',
  },
}

service { 'nginx':
  ensure => 'running',
  enable => true,
}

