# Ensure the hard limit entry for holberton exists, or add it if it doesn't
exec { 'ensure-hard-limit-entry-exists':
  command => 'grep -q "^holberton hard nofile" /etc/security/limits.conf || echo "holberton hard nofile 50000" >> /etc/security/limits.conf',
  path    => '/usr/local/bin:/bin:/usr/bin:/usr/sbin',
}

# Ensure the soft limit entry for holberton exists, or add it if it doesn't
exec { 'ensure-soft-limit-entry-exists':
  command => 'grep -q "^holberton soft nofile" /etc/security/limits.conf || echo "holberton soft nofile 50000" >> /etc/security/limits.conf',
  path    => '/usr/local/bin:/bin:/usr/bin:/usr/sbin',
}

# Increase the hard file limit for the holberton user
exec { 'increase-hard-file-limit-holberton-user':
  command => 'sed -i "/^holberton hard nofile/ s/[0-9]\\+/50000/" /etc/security/limits.conf',
  path    => '/usr/local/bin:/bin:/usr/bin:/usr/sbin',
  require => Exec['ensure-hard-limit-entry-exists'],
}

# Increase the soft file limit for the holberton user
exec { 'increase-soft-file-limit-for-holberton-user':
  command => 'sed -i "/^holberton soft nofile/ s/[0-9]\\+/50000/" /etc/security/limits.conf',
  path    => '/usr/local/bin:/bin:/usr/bin:/usr/sbin',
  require => Exec['ensure-soft-limit-entry-exists'],
}

# Ensure system-wide open files limit is increased
exec { 'increase-system-wide-file-limit':
  command => 'echo "fs.file-max = 500000" > /etc/sysctl.d/99-file-max.conf && sysctl -p /etc/sysctl.d/99-file-max.conf',
  path    => '/usr/local/bin:/bin:/usr/bin:/usr/sbin',
}

# Ensure the pam_limits.so module is enabled in /etc/pam.d/common-session
exec { 'ensure-pam-limits-enabled':
  command => 'grep -q "session required pam_limits.so" /etc/pam.d/common-session || echo "session required pam_limits.so" >> /etc/pam.d/common-session',
  path    => '/usr/local/bin:/bin:/usr/bin:/usr/sbin',
}

# Reload systemd limits to apply changes
exec { 'reload-systemd-limits':
  command => 'systemctl daemon-reload && systemctl restart systemd-logind',
  path    => '/usr/local/bin:/bin:/usr/bin:/usr/sbin',
  subscribe => Exec['increase-system-wide-file-limit', 'increase-hard-file-limit-holberton-user', 'increase-soft-file-limit-for-holberton-user'],
}

# Remove password for the holberton user
exec { 'remove-holberton-password':
  command => 'passwd -d holberton',
  path    => '/usr/local/bin:/bin:/usr/bin:/usr/sbin',
}
