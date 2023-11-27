# setting up my ssh client to connect without using a password
package { 'openssh':
  ensure => 'present',
}

service { 'sshd':
  ensure  => 'running',
  require => Package['openssh'],
}

file_line { 'Turn off passwd auth':
  path    => '/etc/ssh/sshd_config',
  line    => 'PasswordAuthentication no',
  match   => '^#?PasswordAuthentication',
  notify  => Service['sshd'],
  require => Package['openssh'],
}
