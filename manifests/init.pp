class fedora_ds {

  $fedorads_packages = ["389-ds-base.x86_64", "389-admin.x86_64"]

  package { $fedorads_packages:
    ensure => installed,
  }

  file {"/etc/cron.daily/ds-backup":
    source => "puppet:///modules/fedora_ds/ds-backup",
    mode => '0755',
    owner => root,
    group => root,
  }

  service { "dirsrv.target":
    enable => true,
    ensure => running,
	require => Package[$fedorads_packages],
  }

  if hiera("use_nagios") == true {
    include fedora_ds::nagios
  }

}
