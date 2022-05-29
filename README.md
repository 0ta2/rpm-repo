## rpm-repo

Create your own yum repository using Github Page.

## How to add rpm

```bash
$ wget -P repodata https://rpms.remirepo.net/enterprise/7/php81/x86_64/php-8.1.6-1.el7.remi.x86_64.rpm
```

```bash
$ make update
```

## Repository Usage

The following file is to be appended.

`/etc/yum.repos.d/0ta2-rpmrepo.repo`

```
[repos.0ta2-rpmrepo]
name=github-0ta2-rpmrepo
baseurl=https://0ta2.github.io/rpm-repo/
gpgcheck=0
enabled=1
```

```bash
$ yum install php --disablerepo=\* --enablerepo="repos.0ta2-rpmrepo
```
