# Install and configure the load balancer

# Install HAProxy package
package { 'haproxy':
  ensure => installed,
}

# Configure HAProxy init script
file { '/etc/default/haproxy':
  content => "ENABLED=1\n",
}

# Configure HAProxy main configuration file
file { '/etc/haproxy/haproxy.cfg':
  content => "\
frontend my_frontend
  bind *:80
  mode http
  default_backend my_backend

backend my_backend
  mode http
  balance roundrobin
  option httpclose
  option forwardfor
  server 266654-web-01 54.237.38.25:80 check
  server 266654-web-02 100.25.152.122:80 check
",
  notify  => Service['haproxy'],
}

# Enable and start HAProxy service
service { 'haproxy':
  ensure     => running,
  enable     => true,
  hasrestart => true,
}

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Notify the HAProxy service to restart when Nginx is installed
Package['nginx'] -> Service['haproxy']
