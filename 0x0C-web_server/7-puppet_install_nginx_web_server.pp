inifest for automating project requirements using Puppet

# Ensure nginx package is installed
package { 'nginx':
  ensure => installed,
}

# Add a line to the nginx configuration file for redirection
file_line { 'install':
  ensure => present,
  path   => '/etc/nginx/sites-enabled/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.github.com/Medo20300 permanent;',
}

# Create a file with Hello World! content
file { '/var/www/html/index.html':
  ensure  => present,
  content => 'Hello World!',
}

# Ensure nginx service is running and requires nginx package
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
i
