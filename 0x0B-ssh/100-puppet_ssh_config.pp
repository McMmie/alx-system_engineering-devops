# setting up my ssh client to connect without using a password

file { '/etc/ssh/sshd_config':
  ensure  => 'file',
  content => 'PasswordAuthentication no
AuthorizedKeysFile ~/.ssh/school',
  notify  => Service['sshd'],
}
