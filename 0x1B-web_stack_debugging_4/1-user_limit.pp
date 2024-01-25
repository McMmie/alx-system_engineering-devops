# Sets the desired self limit for a user
$soft_limit = 'holberton soft nofile 5000'
$hard_limit = 'holberton hard nofile 5000'
$file_pth = '/etc/security/limits.conf'

exec { 'change-os-for-holberton-user':
  command => "sed -i 's/^holberton soft.*/${soft_limit}/' ${file_pth} ; sed -i 's/^holberton hard.*/${hard_limit}/' ${file_pth}",
  path    => '/usr/bin:/bin:/usr/sbin:/sbin',
}
