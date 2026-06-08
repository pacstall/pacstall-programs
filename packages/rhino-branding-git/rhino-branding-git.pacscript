pkgname="rhino-branding-git"
gives="rhino-branding"
source=("https://github.com/rhino-linux/branding.git")
arch=("all")
pkgver="0.0.1"
pkgrel="3"
pkgdesc="Rhino branding"
maintainer=("Elsie19 <elsie19@pm.me>")

pre_install() {
  sudo dpkg-divert --quiet --package "${gives}" --divert "/etc/skel/.bashrc-divert" --rename "/etc/skel/.bashrc"
}

package() {
  for i in svg png; do
    install -Dm644 branding/"logo.${i}" -t "${pkgdir}/usr/share/branding/rhino/"
  done
  emb="${pkgdir}/usr/share/icons/desktop-base/scalable/emblems/"
  mkdir -p "${emb}"
  ln -sf "/usr/share/branding/rhino/logo.svg" "${emb}/emblem-rhino.svg"
  install -Dm644 branding/bashrc "${pkgdir}/etc/skel/.bashrc"
}

post_install() {
  if ! [[ -f "${homedir}/.bashrc" ]]; then
    cp /etc/skel/.bashrc "${homedir}/.bashrc"
    sudo chown -cR "${PACSTALL_USER}" "${homedir}/.bashrc"
  fi
}

post_remove() {
  sudo dpkg-divert --quiet --package "${gives}" --remove --rename "/etc/skel/.bashrc"
}
