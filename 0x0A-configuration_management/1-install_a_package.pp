#Install flask version 2.1.0

package { 'python3-pip':
  ensure => installed,
}

exec { 'install_flask':
  command     => '/usr/bin/pip3 install Flask==2.1.0',
  path        => '/usr/local/bin:/usr/bin:/bin',
  environment => ['HOME=/root'],
  require     => Package['python3-pip'],
}
