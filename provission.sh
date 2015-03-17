#!/bin/bash

# Download, Make, and Install
curl http://evergreen-ils.org/downloads/opensrf-2.4.0.tar.gz | tar xvz
cd opensrf-2.4.0
make -f src/extras/Makefile.install ubuntu-trusty
./configure --prefix=/openils --sysconfdir=/openils/conf
make && make install

# Create opensrf user
useradd -m -s /bin/bash opensrf
echo \"export PATH=\$PATH:#{PREFIX}/bin\" >> /home/opensrf/.bashrc
chown -R opensrf:opensrf /openils

# Add public and private domains
echo -e "127.0.1.2\tpublic.localhost\tpublic" >> /etc/hosts
echo -e "127.0.1.3\tprivate.localhost\tprivate" >> /etc/hosts

# Adjust the system dynamic library path
echo /openils/lib > /etc/ld.so.conf.d/opensrf.conf
ldconfig

# Configure the ejabberd server
/etc/init.d/ejabberd stop
