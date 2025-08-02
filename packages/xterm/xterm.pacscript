pkgname=xterm
pkgver=401
provides=("x-terminal-emulator")
arch=("any")
section=("x11")
license=("X11")
pkgdesc="X terminal emulator
 xterm is a terminal emulator for the X Window System.  It provides DEC VT102
 and Tektronix 4014 compatible terminals for programs that cannot use the
 window system directly.  This version implements ISO/ANSI colors and most of
 the control sequences used by DEC VT220 terminals.

 This package provides four commands: xterm, which is the traditional
 terminal emulator; uxterm, which is a wrapper around xterm that is
 intelligent about locale settings (especially those which use the UTF-8
 character encoding), but which requires the luit program from the luit
 package; koi8rxterm, a wrapper similar to uxterm for locales that use the
 KOI8-R character set; and lxterm, a simple wrapper that chooses which of the
 previous commands to execute based on the user's locale settings.

 A complete list of control sequences supported by the X terminal emulator
 is provided in /usr/share/doc/xterm.

 The xterm program uses bitmap images provided by the xbitmaps package.

 Those interested in using koi8rxterm will likely want to install the
 xfonts-cyrillic package as well."
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
  'xfonts-cyrillic'
)
maintainer=("Don Alfons <donnisnoni@outlook.com>")
source=("@${pkgname}~${pkgver}::https://github.com/ThomasDickey/xterm-snapshots/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
sha256sum=("3da2b5e64cb49b03aa13057d85e62e1f2e64f7c744719c00d338d11cd3e6ca1a")
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

lxterm_script=$(
  cat << 'EOF'
#!/bin/sh

PROGNAME=${0##*/}

die () {
    echo "${PROGNAME}: fatal error: $*" >&2
    exit 1
}

if ! which locale >/dev/null 2>&1; then
    die "required program \"locale\" not available"
fi

case "$(locale charmap 2>/dev/null)" in
    KOI8-R)
        XTERM=koi8rxterm
        ;;
    UTF-8)
        XTERM=uxterm
        ;;
    *)
        XTERM=xterm
        ;;
esac

exec "${XTERM}" "$@"
EOF
)
lxterm_man=$(
  cat << EOF
.TH lxterm 1 "2004-12-19" "Debian Project"
.SH NAME
lxterm \- locale\-sensitive wrapper for xterm
.SH SYNOPSIS
.B lxterm
[
.I xterm-options
]
.SH DESCRIPTION
.B lxterm
is a wrapper around the
.BR xterm (1)
program that invokes
.BR xterm ,
.BR koi8rxterm (1),
or
.BR uxterm (1)
as appropriate, based on the user's locale setting.
All arguments to
.B lxterm
are passed to
.B xterm
without processing; the
.BR \-class ,
.BR \-k8 ,
and
.B \-u8
options should not be specified because they are used by
.B koi8rxterm
and
.BR uxterm .
See the
.B xterm
manual page for more information on
.IR xterm-options .
.PP
The
.BR locale (1)
utility is used to determine the character set used by the current locale.
If the character set is UTF-8,
.B uxterm
is invoked; if the character set is KOI8-R,
.B koi8rxtem
is invoked; otherwise, \(oqplain\(cq
.B xterm
is invoked.
.SH AUTHOR
Branden Robinson
.SH "SEE ALSO"
.BR locale (1),
.BR koi8rxterm (1),
.BR uxterm (1),
.BR xterm (1)
EOF
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
  make -j1 check
}

package() {
  cd "${pkgname}~${pkgver}"
  make DESTDIR="${pkgdir}" install install-ti

  echo "${lxterm_script}" > lxterm
  install -m 755 lxterm "${pkgdir}/usr/bin"

  echo "${lxterm_man}" > lxterm.1
  install -m 644 lxterm.1 "${pkgdir}/usr/share/man/man1"

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
      x-terminal-emulator.1.gz "/usr/share/man/man1/${term}.1"
  done
}

pre_remove() {
  for term in "${bins[@]}"; do
    update-alternatives --remove x-terminal-emulator "/usr/bin/${term}"
  done
}
