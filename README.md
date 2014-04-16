## Utilisation du module

* Ce module utilise les "hiera", veuillez créer un répertoire "apache" dans le dossier hieradata.
* Dans ce nouveau répertoire veuillez créer un fichier portant le nom suivant : srv1.dev.yaml
* Ce fichier doit contenir ce qui suit :

```
---
nfs::client : 'disabled'
nfs::server : 'enabled'
```

Remarque : si la variable nfs::client est activé (enable), il est possible de configurer les points de montage. Dans ce cas, le hieradata contiendra ce qui suit :


```
---
nfs::server : 'disabled'
nfs::client : 'enable'
nfs::mounts:
    '/POINT_DE_MONTAGE':
        where:      'NFS_SERVER_HOSTNAME:/REPERTOIRE_DISTANT'
```



