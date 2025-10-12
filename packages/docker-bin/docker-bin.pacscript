pkgname="docker-bin"
gives="docker"
provides=("${gives}-ce" "${gives}-ce-cli" "${gives}.io" "containerd.io" "containerd" "runc")
replaces=("${gives}-desktop" "${provides[@]}")
conflicts=("${replaces[@]}")
repology=("project: ${gives}")
pkgver="28.3.2"
depends=("procps" "git" "iptables" "fuse-overlayfs")
pkgdesc="Docker Engine Static Binaries"
maintainer=("Oren Klopfer <oren@taumoda.com>")
arch=('arm64' 'amd64')
sha256sums_arm64=("61c65bddb74ea73ba9644769ae673b9cb05b8ae66902393d6123d05a5b07ee01")
sha256sums_amd64=("9d274a3f330764ebd9cc82fe29e5dd5d0569bc34f9f53e3ac8905444cd88b413")
source_amd64=("https://download.docker.com/linux/static/stable/x86_64/${gives}-${pkgver}.tgz")
source_arm64=("https://download.docker.com/linux/static/stable/aarch64/${gives}-${pkgver}.tgz")

build() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/lib/systemd/system"
}

package() {
  cp -r "${gives}"/* -t "${pkgdir}/usr/bin"
  # shellcheck disable=SC2016
  echo '[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network-online.target docker.socket firewalld.service containerd.service time-set.target
Wants=network-online.target containerd.service
Requires=docker.socket

[Service]
Type=notify
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
ExecReload=/bin/kill -s HUP $MAINPID
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
WantedBy=multi-user.target' | tee "${pkgdir}/lib/systemd/system/docker.service" > /dev/null

  echo '[Unit]
Description=Docker Socket for the API

[Socket]
ListenStream=/run/docker.sock
SocketMode=0660
SocketUser=root
SocketGroup=docker

[Install]
WantedBy=sockets.target' | tee "${pkgdir}/lib/systemd/system/docker.socket" > /dev/null

  echo '# Copyright The containerd Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

[Unit]
Description=containerd container runtime
Documentation=https://containerd.io
After=network.target local-fs.target

[Service]
ExecStartPre=-/sbin/modprobe overlay
ExecStart=/usr/bin/containerd

Type=notify
Delegate=yes
KillMode=process
Restart=always
RestartSec=5
# Having non-zero Limit*s causes performance problems due to accounting overhead
# in the kernel. We recommend using cgroups to do container-local accounting.
LimitNPROC=infinity
LimitCORE=infinity
LimitNOFILE=infinity
# Comment TasksMax if your systemd version does not supports it.
# Only systemd 226 and above support this version.
TasksMax=infinity
OOMScoreAdjust=-999

[Install]
WantedBy=multi-user.target' | tee "${pkgdir}/lib/systemd/system/containerd.service" > /dev/null
}

post_install() {
  if ! grep -q docker /etc/group; then
    sudo groupadd docker
  fi
  if ! grep docker /etc/group | grep -q "${PACSTALL_USER}"; then
    sudo usermod -aG docker "${PACSTALL_USER}"
  fi
  if [[ -f /bin/systemctl ]]; then
    sudo systemctl enable containerd.service docker.socket docker.service
  fi
}

post_remove() {
  if [[ -f /bin/systemctl ]]; then
    for i in multi-user.target.wants/containerd.service multi-user.target.wants/docker.service sockets.target.wants/docker.socket; do
      sudo rm /etc/systemd/system/"${i}" && echo "Removed /etc/systemd/system/${i}."
    done
  fi
}
