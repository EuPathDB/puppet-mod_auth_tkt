
class mod_auth_tkt::config {

  file { '02_auth_tkt.conf':
    ensure  => file,
    path    => "${::apache::confd_dir}/${conf}",
    content => template('mod_auth_tkt/auth_tkt.conf.erb'),
    mode    => '0640',
    owner   => 'root',
    group   => $::apache::params::group,
    require => Exec["mkdir ${::apache::confd_dir}"],
    before  => File[$::apache::confd_dir],
    notify  => Class['apache::service'],
  }

}