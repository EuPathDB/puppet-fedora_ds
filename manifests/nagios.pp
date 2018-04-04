class fedora_ds::nagios {
    
     @@nagios_service { "check_ldap_apidb_${hostname}":
       ensure => present,
       use => "check-ldap-apidb",
       host_name => "$fqdn",
       tag => "public";
    }

    # override custom nagios fact detecting presence of httpd
    nagios::client::config { 'check_httpd_ensure': value => 'absent' }
}
