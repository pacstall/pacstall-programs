pkgname="dremio-bin"
gives="dremio"
pkgver="4.9.1"
fullver="4.9.1-202010230218060541-2e764ed0"
depends=("openjdk-8-jdk")
url='https://www.dremio.com/'
pkgdesc="Dremio: Data Lakehouse Platform Powered by Apache Iceberg"
maintainer=("Luca Fabbian <luca.fabbian.1999@gmail.com>")
arch=('amd64')
sha256sums=("ccd0ac89c9d3dc13eee8eba0f3f489b3f9efc7a897c1c550d919fcc294c749f9")
source=("https://download.dremio.com/community-server/${fullver}/${gives}-community-${fullver}.tar.gz")

build() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/lib/systemd/system"
}

package() {
  cp -r "${gives}-community-${fullver}"/* "${pkgdir}/opt/${pkgname}"

  # shellcheck disable=SC2016
  echo '#!/bin/bash
# Set the JAVA_HOME for this script
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# Forward execution to dremio script
bash "/opt/'"${pkgname}"'/bin/dremio" "$@"' | tee "${pkgdir}/usr/bin/dremio" > /dev/null
  chmod +x "${pkgdir}/usr/bin/dremio"

  echo '[Unit]
Description=Dremio Daemon Server
Documentation=https://docs.dremio.com
Wants=network-online.target
After=network-online.target

[Service]
User=root
Group=root
ExecStart=/usr/bin/dremio start-fg
Restart=on-failure
LimitNOFILE=65536


[Install]
WantedBy=multi-user.target' | tee "${pkgdir}/lib/systemd/system/dremio.service" > /dev/null
}

post_install() {
  if [[ -f /bin/systemctl ]]; then
    sudo systemctl enable dremio.service --now
  fi
}

post_remove() {
  if [[ -f /bin/systemctl ]]; then
    sudo rm "/etc/systemd/system/multi-user.target.wants/dremio.service" && echo "Removed /etc/systemd/system/multi-user.target.wants/dremio.service"
  fi
}
