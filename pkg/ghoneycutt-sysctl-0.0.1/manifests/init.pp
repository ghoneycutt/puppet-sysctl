# Class: sysctl
#
# This module manages sysctl, which is included in the $operatingsystem module
#
class sysctl { 

    # look for a host specific version, then an OS specific version
    file { "/etc/sysctl.conf":
        source => [ "puppet:///modules/sysctl/sysctl.conf-$fqdn", "puppet:///modules/sysctl/sysctl.conf-$operatingsystem" ],
        mode   => "640",
        notify => Exec["reload sysctl"],
        links  => follow,
    } # file
    
    exec{ "reload sysctl":
        command     => "/sbin/sysctl -p",
        refreshonly => "true",
    } # exec
} # class sysctl
