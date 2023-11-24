# This is my first Puppet manifest
# this mannifest creates a new file in the /tmp folder
file { '/tmp/school':
  ensure  => 'file',
  path    => '/tmp/school',
  group   => 'www-data',
  mode    => '0744',
  owner   => 'www-data',
  content => 'I love Puppet',
}
