#!/usr/bin/env bashi
# Puppet script to create ssh config file
file { 'etc/ssh/ssh_config':
	ensure => present, 
content =>"

	#SSh client configuration
	host*
	IdentityFile ~/.ssh/school
	passwordAuthentication no
	",
}


