pkgname="xterm"
pkgver="401a"
provides=("x-terminal-emulator")
arch=("any")
section=("x11")
license=("X11")
pkgdesc="X terminal emulator for the X Window System"
url='https://invisible-island.net/xterm/'
depends=(
  'libfontconfig1>=2.12.6'
  'libfreetype6>=2.2.1'
  'libice6>=1:1.0.0'
  'libtinfo6>=6'
  'libutempter0>=1.1.5'
  'libx11-6'
  'libxaw7>=2:1.0.14'
  'libxext6'
  'libxft2>>2.1.1'
  'libxinerama1>=2:1.1.4'
  'libxmu6>=2:1.1.3'
  'libxpm4'
  'libxt6'
  'xbitmaps'
)
makedepends=(
  'bsdextrautils'
  'desktop-file-utils'
  'groff'
  'libncurses-dev'
  'libutempter-dev'
  'libxaw7-dev'
  'libxcursor-dev'
  'libxft-dev'
  'libxinerama-dev'
  'libxkbfile-dev'
  'libxrender-dev'
  'xbitmaps'
  'xorg-docs-core'
)
recommends=(
  'luit'
  'x11-utils<7.7+6~'
)
suggests=(
  'xfonts-cyrillic'
)
maintainer=("Don Alfons <donnisnoni@outlook.com>")
source=(
  "@${pkgname}~${pkgver}::https://github.com/ThomasDickey/xterm-snapshots/archive/refs/tags/${pkgname}-${pkgver}.tar.gz"
  "lxterm::https://raw.githubusercontent.com/itsdonnix/pacstall-programs/xterm/packages/xterm/lxterm"
  "lxterm.1::https://raw.githubusercontent.com/itsdonnix/pacstall-programs/xterm/packages/xterm/lxterm.1"
)
sha256sum=(
  "3da2b5e64cb49b03aa13057d85e62e1f2e64f7c744719c00d338d11cd3e6ca1a"
  "92f030891c2306718e242ee784b9c12bb5dfcd01baf34c1992162011caec892f"
  "2b8de0753450ab2fdd9bc5a10f5fa9feaac4abae3b86ac773aef3652a6e56cda"
)
bins=('xterm' 'uxterm' 'koi8rxterm' 'lxterm')
CFLAGS=(
  '-g'
  '-O2'
  '-Werror=implicit-function-declaration'
  '-fno-omit-frame-pointer'
  '-mno-omit-leaf-frame-pointer'
  '-flto=auto'
  '-ffat-lto-objects'
  '-fstack-protector-strong'
  '-fstack-clash-protection'
  '-Wformat'
  '-Werror=format-security'
  '-fcf-protection'
)
LDFLAGS=(
  '-Wl,-Bsymbolic-functions'
  '-flto=auto'
  '-ffat-lto-objects'
  '-Wl,-z,relro'
)
CPPFLAGS=(
  '-Wdate-time'
  '-D_FORTIFY_SOURCE=3'
  '-DDEF_ALLOW_FONT=False'
  '-DDEF_ALLOW_TCAP=False'
  '-DDEF_DISALLOWED_WINDOW=\"1,2,3,4,5,6,7,8,9,11,13,14,18,19,20,21,GetSelection,SetSelection,SetWinLines,SetXprop\"'
)

prepare() {
  cd "${pkgname}~${pkgver}"
  ./configure \
    --prefix=/usr \
    --with-app-defaults=/etc/X11/app-defaults \
    --with-icondir=/usr/share/icons \
    --with-icon-theme=yes \
    --with-tty-group=tty \
    --enable-warnings \
    --enable-logging \
    --enable-wide-chars \
    --enable-256-color \
    --disable-tek4014 \
    --disable-imake \
    --enable-narrowproto \
    --enable-exec-xterm \
    --enable-dabbrev \
    --enable-backarrow-is-erase \
    --enable-pty-erase \
    --enable-sixel-graphics \
    --with-utempter \
    --with-utmp-path=/var/run/utmp \
    --with-wtmp-path=/var/log/wtmp \
    --with-desktop-category=System,TerminalEmulator \
    CFLAGS="${CFLAGS[*]}" \
    CPPFLAGS="${CPPFLAGS[*]}" \
    LDFLAGS="${LDFLAGS[*]}"
}

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

check() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}" check
}

package() {
  cd "${pkgname}~${pkgver}"
  make DESTDIR="${pkgdir}" install install-ti

  install -m 755 "${srcdir}/lxterm" "${pkgdir}/usr/bin/lxterm"
  install -m 644 "${srcdir}/lxterm.1" "${pkgdir}/usr/share/man/man1/lxterm.1"

  find "${pkgdir}/usr/share/man/man1/" -type f -print0 | xargs -0 gzip -f

  install -d "${pkgdir}/usr/share/licenses/xterm"
  install -m 644 "COPYING" "${pkgdir}/usr/share/licenses/xterm/LICENSE"

  install -d "${pkgdir}/usr/share/doc/xterm"
  install -m 644 termcap "${pkgdir}/usr/share/doc/xterm/xterm.termcap"
  install -m 644 terminfo "${pkgdir}/usr/share/doc/xterm/xterm.terminfo"
}

post_install() {
  for term in "${bins[@]}"; do
    update-alternatives \
      --install /usr/bin/x-terminal-emulator \
      x-terminal-emulator "/usr/bin/${term}" 20 \
      --slave /usr/share/man/man1/x-terminal-emulator.1.gz \
      x-terminal-emulator.1.gz "/usr/share/man/man1/${term}.1.gz"
  done
}

pre_remove() {
  for term in "${bins[@]}"; do
    update-alternatives --remove x-terminal-emulator "/usr/bin/${term}"
  done
}
