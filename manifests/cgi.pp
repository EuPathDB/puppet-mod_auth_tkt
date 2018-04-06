# Installs the CGI portions for mod_auth_tkt
#
#       /usr/share/mod_auth_tkt/AuthTktConfig.pm
#       /usr/share/mod_auth_tkt/login.cgi
#       /usr/share/mod_auth_tkt/logout.cgi
#       /usr/share/mod_auth_tkt/tkt.css
#
# Instead of using this, you may want to use customized
# scripts/perlmodules installed from a profile.
#
class mod_auth_tkt::cgi {

  package { 'mod_auth_tkt-cgi':
    ensure => 'installed',
  }

}