pkgname="ollama-bin"
gives="ollama"
pkgdesc="Get up and running with large language models"
repology=("project:ollama")
license=("MIT")
url='https://ollama.com/'
arch=("amd64" "arm64")
pkgver="0.9.2"
source=(
  "https://github.com/${gives}/${gives}/releases/download/v${pkgver}/${gives}-linux-${CARCH}.tgz"
  "ollama.service"
)
sha256sums_amd64=(
  "2f652de76cf341ecab6975d11ea0d311a970c877f108a434507497e2c5655009"
  "e6893011419cf5d3073f713a130f112b61bbd1ce6f64ee9b4513c6f020f9624a"
)
sha256sums_arm64=(
  "146d65ae0009a69f6283ae9c4679f81466c1b01beb10423b6fefda0ed1847e8e"
  "e6893011419cf5d3073f713a130f112b61bbd1ce6f64ee9b4513c6f020f9624a"
)
optdepends_ubuntu=(
  "libnvidia-compute-390 | libnvidia-compute-418 | libnvidia-compute-430 | libnvidia-compute-440 | libnvidia-compute-450 | libnvidia-compute-455 | libnvidia-compute-460 | libnvidia-compute-465 | libnvidia-compute-470 | libnvidia-compute-495 | libnvidia-compute-510 | libnvidia-compute-515 | libnvidia-compute-520 | libnvidia-compute-525 | libnvidia-compute-530 | libnvidia-compute-535 | libnvidia-compute-545 | libnvidia-compute-550: required to use CUDA on NVIDIA GPU"
)
optdepends_debian=(
  "libcuda1: required to use CUDA on NVIDIA GPU"
)
maintainer=("bibelin <balian1belin@yandex.ru>")

package() {
  install -Dm755 "${srcdir}/bin/ollama" "${pkgdir}/usr/bin/${gives}"
  find "${srcdir}/lib/${gives}" -type "f" -exec install -Dm644 "{}" -t "${pkgdir}/usr/lib/${gives}" \;
  find "${srcdir}/lib/${gives}" -type "l" -exec install -Dm644 "{}" -t "${pkgdir}/usr/lib/${gives}" \;
  install -Dm644 "${gives}.service" "${pkgdir}/usr/lib/systemd/system/${gives}.service"
}

post_install() {
  # Adopted from https://github.com/ollama/ollama/blob/24636dfa87c3759b1d89efc47a1fd01623058fd1/scripts/install.sh#L105
  if ! id ollama > /dev/null 2>&1; then
    useradd -r -s /bin/false -U -m -d /usr/share/ollama ollama
  fi
  if getent group render > /dev/null 2>&1; then
    usermod -a -G render ollama
  fi
  if getent group video > /dev/null 2>&1; then
    usermod -a -G video ollama
  fi

  usermod -a -G ollama "${PACSTALL_USER}"

  SYSTEMCTL_RUNNING="$(systemctl is-system-running || true)"
  case ${SYSTEMCTL_RUNNING} in
    running | degraded)
      systemctl daemon-reload
      systemctl enable ollama
      systemctl start ollama
      ;;
    *) ;;
  esac
}

post_upgrade() {
  SERVICE_ENABLED="$(systemctl is-enabled ollama || true)"
  case ${SERVICE_ENABLED} in
    enabled | enabled-runtime)
      systemctl restart ollama
      ;;
    *) ;;
  esac
}

pre_remove() {
  SYSTEMCTL_RUNNING="$(systemctl is-system-running || true)"
  case ${SYSTEMCTL_RUNNING} in
    running | degraded)
      systemctl stop ollama
      systemctl disable ollama
      ;;
    *) ;;
  esac
}
