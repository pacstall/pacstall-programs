# Based on https://aur.archlinux.org/packages/mutt-wizard/

maintainer=("JonBoyleCoding <programmerfalcon@gmail.com>")

pkgname="mutt-wizard"
arch=("any")
pkgver="3.3.1"
source=("@${pkgname}~${pkgver}::https://github.com/lukesmithxyz/${pkgname}/archive/v${pkgver}.tar.gz")
repology=("project: mutt-wizard")
depends=("neomutt" "isync" "msmtp" "notmuch" "pass" "curl")
breaks=("mutt-wizard" "mutt-wizard-git")
pkgdesc="Simple interface to auto-configure neomutt and isync with safe passwords"
sha256sums=("4091fba053786d4143249e61dfddfd679c15f561ec34af17f130a3ca80c39b53")

# Some optional dependencies don't currently have an ubuntu package as far as I know,
# they have been marked with "No Pkg" in the optdepends.

optdepends=('imagemagick: view images inside of the neomutt TUI'
  'w3m: view HTML email and images inside of the neomutt TUI'
  'lynx: view HTML email inside of the neomutt TUI'
  'links: view HTML email inside of the neomutt TUI'
  'elinks: view HTML email inside of the neomutt TUI'
  'urlview: list URLs found in mails to open them in a browser'
  'abook: contact store and tab completion'
  # No Pkg    'protonmail-bridge: use neomutt with protonmail accounts'
  # No Pkg    'pam-gnupg: automatically unlock gpg keys at session login'
  'cron: set up automatic mail syncing')

package() {
  cd "${pkgname}~${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
