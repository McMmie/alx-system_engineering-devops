#sets the desired ulimit value
$ulimit_value = "\"-n 4096\""  # Set the desired ulimit value

exec { 'fix_for_nginx':
  command => "sed -i 's/^ULIMIT.*/ULIMIT=${ulimit_value}/' /etc/default/nginx",
  path    => '/bin',  # Specify the path to the sed command
}
