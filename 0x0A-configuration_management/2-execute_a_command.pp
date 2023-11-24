# Kills a process
exec { '2-execute_a_command':
  command => 'pkill -f killmenow',
  onlyif  => 'pgrep -f killmenow',
  path    => '/bin:/usr/bin',
}
