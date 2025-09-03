from quay.io/centos/centos:stream10
MAINTAINER Paul Maddox <paul@sonelli.com>

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

ADD bash-android.patch /home/admin/
ADD official_patches /home/admin/official_patches
ADD build /home/admin/
RUN chmod 755 /home/admin/build
RUN mkdir /target

CMD /home/admin/build
