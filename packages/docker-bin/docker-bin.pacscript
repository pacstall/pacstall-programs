name="docker-bin"
gives="docker"
replace=("${gives}-desktop" "${gives}-ce" "${gives}-ce-cli" "containerd.io")
repology=("project: ${gives}")
pkgver="24.0.7"
depends=("procps" "git" "iptables")
pkgdesc="Docker Engine Static Binaries"
maintainer="Oren Klopfer <oren@taumoda.com>"
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  gnuarch="aarch64"
  hash="fe6cf4b509307665af542a89454c2ecfbbd62670fc5a5d17bac7150a6f6a6776"
else
  gnuarch="x86_64"
  hash="984d59a77fa6acab97ea725a966facd33725e0e09c2fee975397fe1c6379bd3d"
fi
url="https://download.docker.com/linux/static/stable/${gnuarch}/${gives}-${pkgver}.tgz"

build() {
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo mkdir -p "${pkgdir}/lib/systemd/system"
}

package() {
  sudo cp -r "../${gives}"/* -t "${pkgdir}/usr/bin"
  echo "[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network-online.target docker.socket firewalld.service containerd.service time-set.target
Wants=network-online.target containerd.service
Requires=docker.socket

[Service]
Type=notify
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
ExecReload=/bin/kill -s HUP \$MAINPID
TimeoutStartSec=0
RestartSec=2
Restart=always
StartLimitBurst=3
StartLimitInterval=60s
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity
TasksMax=infinity
Delegate=yes
KillMode=process
OOMScoreAdjust=-500

[Install]
WantedBy=multi-user.target" | sudo tee "${pkgdir}/lib/systemd/system/docker.service" > /dev/null

  echo "[Unit]
Description=Docker Socket for the API

[Socket]
ListenStream=/run/docker.sock
SocketMode=0660
SocketUser=root
SocketGroup=docker

[Install]
WantedBy=sockets.target" | sudo tee "${pkgdir}/lib/systemd/system/docker.socket" > /dev/null
}

post_install() {
  if [[ -z $(cat /etc/group | grep docker) ]]; then
    sudo groupadd docker
  fi
  if [[ -f /bin/systemctl ]]; then
    sudo systemctl enable docker.socket docker.service
    sudo systemctl start docker.socket docker.service
  fi
}

post_remove() {
  if [[ -f /bin/systemctl ]]; then
    sudo systemctl disable docker.socket docker.service
    sudo systemctl stop docker.socket docker.service
  fi
}
