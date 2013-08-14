# Class: nfs
#
#
class nfs(
    $client = hiera('nfs::client')) {

    $packages = ['nfs-common', 'rpcbind']

    package { $packages:
        ensure => installed,
    }

    if $client == 'enable' {
        $mounts = hiera('nfs::mounts')
        create_resources('nfs::mount', $mounts)
    }
}

