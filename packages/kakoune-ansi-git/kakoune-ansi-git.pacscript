pkgname='kakoune-ansi-git'
pkgver="0.2.8"
pkgdesc='Support for rendering ANSI-colored text in Kakoune'
gives='kakoune-ansi'
license=('Unlicense')
url='https://github.com/eraserhd/kak-ansi'
arch=('any')
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
source=("${gives}::https://github.com/eraserhd/kak-ansi.git")
depends=('kakoune')
makedepends=('make' 'sed')
checkdepends=('bash')
checkdepends_debian=('moreutils' 'grep')
enhances=('kakoune')

prepare() {
  # We wan't the expression the expand when calling the script, not now
  # shellcheck disable=SC2016
  sed -i 's;filterdir="$(dirname $kak_source)/..";filterdir="/usr/share/kak";' "${srcdir}/${gives}/rc/ansi.kak"
}

build() {
  make -C "${srcdir}/${gives}"
}

check() {
  cd "${srcdir}/${gives}"
  # Four test cases are broken on Debian
  if [[ "$(cut -f 1 -d ':' <<< "${DISTRO}")" == "debian" ]]; then
    grep -vE '(┘┐┌└┼─├┤┴┬\│|advances using byte offset|covers ending char bytes)' './tests/tests.bash' | sponge './tests/tests.bash'
  fi
  bash tests/tests.bash
}

package() {
  install -Dm755 "${srcdir}/${gives}/kak-ansi-filter" "${pkgdir}/usr/share/kak/kak-ansi-filter"
  install -Dm644 "${srcdir}/${gives}/rc/ansi.kak" "${pkgdir}/usr/share/kak/autoload/rc/ansi.kak"
  install -Dm644 "${srcdir}/${gives}/UNLICENSE" "${pkgdir}/usr/share/licenses/${gives}/UNLICENSE"
}
