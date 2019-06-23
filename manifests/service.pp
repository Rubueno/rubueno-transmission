# == Class: transmission::service
#
class transmission::service (
  $service_enable = $transmission::service_enable,
  $service_name   = $transmission::service_name,
) {
  if $service_enable {
    service { $service_name:
      ensure => $service_enable,
      enable => $service_enable,
    }
  }
}
