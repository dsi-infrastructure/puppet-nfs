# Define: nfs::mount
# Parameters:
# arguments
#
define nfs::mount ($where) {

    file { $name:
        ensure => directory,
    }

    mount { $name:
        #device  => "nas.$domain:/volume1/bacula",
        device   => $where,
        fstype   => 'nfs',
        #ensure   => mounted,
        options  => 'rw,rsize=8192,wsize=8192,timeo=14,intr',
        atboot   => true,
        require  => File[$name],
        remounts => false,
    }
}
