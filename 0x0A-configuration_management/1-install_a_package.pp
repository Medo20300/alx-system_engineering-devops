# Install puppet-lint
package { 'puppet-lint':
ensure   => '5.5.10',
provider => 'gem'
}
