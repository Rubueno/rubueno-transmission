# == Class: transmission::service
#
class transmission::service (
  $service_enable = $transmission::service_enable,
  $service_name   = $transmission::service_name,
) {
  if $service_enable {
    include ::systemd

    service { $service_name:
      ensure => $service_enable,
      enable => $service_enable,
    }

    systemd::dropin_file { "${service_name}.conf":
      unit    => "${service_name}.service",
      content => "[Service]\nRestart=always\n",
      #      notify  => Service[$service_name],
    }
  }
}
