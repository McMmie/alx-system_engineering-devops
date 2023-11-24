# This is my first Puppet manifest
# this mannifest creates a new file in the /tmp folder
file { '/tmp/school':
  ensure  => 'file',
  owner   => 'www-data',
  mode    => '0744',
  content => 'I love Puppet',
}
