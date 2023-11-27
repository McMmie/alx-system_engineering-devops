# setting up my ssh client to connect without using a password
class ssh_config {
  package { 'openssh-server':
    ensure => 'installed'
  }

  service { 'sshd':
    ensure  => running,
    enable  => true,
    require => Package['openssh-server'],
  }
  augeas { 'sshd_config':
    context => '/etc/ssh/sshd_config',
    changes => [
      'set PasswordAuthentication no',
      'set IdentityKey ~/.ssh/school',
    ],
    notify  => Service['sshd'],
  }
}

