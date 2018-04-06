
class mod_auth_tkt (
  $secret = undef,
  $conf_tmpl = 'mod_auth_tkt/auth_tkt.conf.erb',
) {

  $auth_tkt_conf    = '02_auth_tkt.conf'
  $packages         = ['perl-Apache-AuthTkt', 'mod_auth_tkt']
  $apache_confd_dir = '/etc/httpd/conf.d'
  $apache_group     = 'apache'

  package { $packages:
    ensure => 'installed',
  }

  file { "${apache_confd_dir}/${auth_tkt_conf}":
    ensure  => file,
    path    => "${apache_confd_dir}/${auth_tkt_conf}",
    content => template($conf_tmpl),
    mode    => '0640',
    owner   => 'root',
    group   => $apache_group,
    notify  => Service['httpd'],
    require => Package['httpd'],
  }

}