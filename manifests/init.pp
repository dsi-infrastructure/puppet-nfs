# Class: nfs
#
#
class nfs(
    $client = hiera('nfs::client'),
    $server = hiera('nfs::server', 'disable')) {

    if $client == 'enable' {
        $packages = ['nfs-common', 'rpcbind']
    }

    if $server == 'enable' {
       $packages = ['nfs-kernel-server']
    }

    package { $packages:
        ensure => installed,
    }

    if $server == 'enable' {
        file { '/etc/default/nfs-common':
            ensure  => present,
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            source  => 'puppet:///modules/nfs/server-nfs-common',
            #notify  => Exec['restart-nfs'],
            require => Package['nfs-kernel-server'],
        }

        file { '/etc/default/nfs-kernel-server':
            ensure  => present,
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            source  => 'puppet:///modules/nfs/server-nfs-kernel-server',
            #notify  => Exec['restart-nfs'],
            require => Package['nfs-kernel-server'],
        }
    }

    if $client == 'enable' {
        $mounts = hiera('nfs::mounts')
        create_resources('nfs::mount', $mounts)
    }
}

