# setting up my ssh client to connect without using a password
file_line { 'identity file':
  ensure => 'present'
  path   => '/etc/ssh/sshd_config',
  line   => 'AuthorizedKeysFile ~/.ssh/school',
  match  => '^AuthorizedKeysFile',
}
file_line { 'Turn off passwd auth':
  ensure => 'present'
  path   => '/etc/ssh/sshd_config',
  line   => 'PasswordAuthentication no',
  match  => '^#?PasswordAuthentication',
}
