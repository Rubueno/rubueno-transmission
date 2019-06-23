# == Class: transmission::install
#
class transmission::install (
  $manage_epel = $transmission::manage_epel,
  $packages    = $transmission::packages,
  $user        = $transmission::user,
  $group       = $transmission::user,
) {

  if $manage_epel {
    package { 'epel-release':
      ensure => 'installed',
    }
  }

  package { $packages:
    ensure => installed,
  }

  group { $group:
    ensure => present,
  }

  user { $user:
    ensure     => present,
    shell      => '/sbin/nologin',
    groups     => $group,
    managehome => true,
  }
}
