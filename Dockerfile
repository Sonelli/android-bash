from --platform=linux/amd64 quay.io/centos/centos:stream10
label org.opencontainers.image.authors="paul@sonelli.com"

run yum -y update
run dnf config-manager --set-enabled crb
run dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm

run touch /etc/sysconfig/network
run yum -y install git wget tar unzip
run rpm -Uvh https://yum.puppet.com/puppet8-release-el-9.noarch.rpm
run dnf -y install puppet-agent
run rm -rf /var/lib/puppet
run git clone https://github.com/sonelli/puppet-android-cross-compile.git /var/lib/puppet
run /var/lib/puppet/run

add bash-android.patch /home/admin/
add official_patches /home/admin/official_patches
add build /home/admin/
run chmod 755 /home/admin/build
run mkdir /target

cmd /home/admin/build
