# This puppet manifest corrects a typo in the settings file of apache

exec { 'fix_typo' :
  command => 'sed -i "s/\.phpp/\.php/g" /var/www/html/wp-settings.php'
     path => 'usr/bin:/bin:/usr/sbin:/sbin'
   onlyif => 'grep -q "\.phpp" /var/www/html/wp-settings.php'
}
