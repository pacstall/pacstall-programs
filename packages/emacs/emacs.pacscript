#!/usr/bin/bash
# shellcheck disable=2034
#-*- mode: sh-*-
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "wizard-28 <wiz28@pm.me>")

### This pacscript was originally ported to pacstall with the help of https://aur.archlinux.org/cgit/aur.git/commit/?h=emacs-git&id=b9eb3b405717f8df37b38217dbb7d361b8ffca08
###################################################################################
# Assign "YES" to the variable you want enabled; empty or any other value
# for NO.
#
# Where you read experimental, replace with foobar.
# =================================================
#
################################################################################
CLANG=            # Use clang.

GOLD=             # Use the gold linker.

LTO=              # Enable link-time optimization. Still experimental.

JIT="YES"         # Enable native just-in-time compilation. libgccjit is in AUR.
                  # This compiles only performance critical elisp files.
                  #
                  # To compile all site-lisp on demand (repos/AUR packages,
                  # ELPA, MELPA, whatever), add
                  #    (setq comp-deferred-compilation t)
                  # to your .emacs file.

AOT="YES"         # Compile all elisp files.

CLI=              # CLI only binary.

GPM=              # Mouse support in Linux console using gpmd.

NOTKIT=           # Use no toolkit widgets. Like B&W Twm (001d sk00l).
                  # Bitmap fonts only, 1337!

PGTK=             # Use native GTK3 build. Supports Wayland, yay!

GTK3="YES"        # GTK3 old windowing interface.

LUCID=            # Use the lucid, a.k.a athena, toolkit. Like XEmacs, sorta.
                  #
                  # Read https://wiki.archlinux.org/index.php/X_resources
                  # https://en.wikipedia.org/wiki/X_resources
                  # and https://www.emacswiki.org/emacs/XftGnuEmacs
                  # for some tips on using outline fonts with
                  # Xft, if you choose no toolkit or Lucid.

XI2="YES"         # Use Xinput2 support.
                  # https://www.x.org/releases/X11R7.7/doc/inputproto/XI2proto.txt

ALSA="YES"             # Linux sound support.

NOCAIRO=          # Disable here.

XWIDGETS=         # Use GTK+ widgets pulled from webkit2gtk. Usable.

DOCS_HTML=        # Generate and install html documentation.

DOCS_PDF=         # Generate and install pdf documentation.

NOGZ="YES"        # Don't compress .el files.

# --- Modern features / library bindings --------------------------------------
# The following toggles enable optional capabilities that a modern Emacs
# build is expected to have. They default to "YES" when the required
# library is already declared as a dependency. Set to empty to disable.

HARFBUZZ="YES"    # HarfBuzz shaping for high-quality font rendering.
                  # Required for proper display of complex scripts, ligatures
                  # and modern variable fonts.
                  # Adds libharfbuzz0b (dep) + libharfbuzz-dev (makedep).

JSON="YES"        # Native JSON support via libjansson. Used by many built-in
                  # and third-party packages (e.g. package.el, elfeed,
                  # request). Adds libjansson4 (dep) + libjansson-dev (makedep).

XML2="YES"        # libxml2 bindings (xml-parse-string, dom, xpath ...).
                  # Useful for parsing HTML/RSS and many web-related modes.

GNUTLS="YES"      # TLS/SSL support via GnuTLS. Required for `gnutls-verify',
                  # network security streams and most remote package access.

SQLITE3="YES"     # Built-in SQLite support (sqlite3-open, sqlite3-execute).
                  # Needed by org-roam, emacs-sqlite3 and similar packages.

WEBP="YES"        # WebP image support. Adds libwebp7 (dep) + libwebp-dev (makedep).

LCMS2="YES"       # LittleCMS2 color management. Ensures consistent colors
                  # across displays, especially useful for image viewing.

NSS="YES"         # Mozilla NSS as an additional TLS backend (in addition to
                  # GnuTLS). Required by some corporate/captive web sites.

SYSTEMD="YES"     # systemd integration (file notifications via inotify fd
                  # passing). Harmless when systemd is not the init system.

TREE_SITTER=      # Tree-sitter incremental parsing. Still relatively new
                  # upstream, so left opt-in. Adds libtree-sitter0 (dep) +
                  # libtree-sitter-dev (makedep) when enabled.
#################################################################################

pkgname="emacs"
arch=("any")
pkgver="30.2"
source=("@${pkgname}~${pkgver}::http://ftpmirror.gnu.org/emacs/emacs-${pkgver}.tar.xz")
pkgdesc="An extensible, customizable, free/libre text editor — and more."
repology=("project: ${pkgname}")
makedepends=("git" "autoconf" "texinfo" "pkg-config" "libncurses-dev" "libjpeg-dev" "libpng-dev" "libtiff-dev" "libgif-dev" "libxaw7-dev" "libxpm-dev")
depends_nox=("libalsaplayer0" "gpm")
optdepends=("texlive-latex-recommended: for exporting org-mode buffers to PDF")
# Every library below is gated on its toggle further down; nothing library-specific is unconditional here.
depends=("${depends_nox[@]}")
gives="${pkgname}"
breaks=("${pkgname}-git" "${pkgname}-nox")
replaces=("${pkgname}-git" "${pkgname}-nox")
sha256sums=("b3f36f18a6dd2715713370166257de2fae01f9d38cfe878ced9b1e6ded5befd9")
repology=("project: emacs")

if [[ ${GOLD} == "YES" && ${CLANG} != "YES" ]]; then
  export LD=/usr/bin/ld.gold
  export CFLAGS+=" -fuse-ld=gold"
  export CXXFLAGS+=" -fuse-ld=gold"
elif [[ ${GOLD} == "YES" && ${CLANG} == "YES" ]]; then
  fancy_message error "Clang rather uses its own linker."
  exit 1
fi
if [[ ${CLANG} == "YES" ]]; then
  export CC="/usr/bin/clang"
  export CXX="/usr/bin/clang++"
  export CPP="/usr/bin/clang -E"
  export LD="/usr/bin/lld"
  export AR="/usr/bin/llvm-ar"
  export AS="/usr/bin/llvm-as"
  export CFLAGS+=" -fuse-ld=lld"
  export CXXFLAGS+=" -fuse-ld=lld"
  makedepends+=("clang" "lld" "llvm")
fi
if [[ ${LTO} == "YES" ]]; then
  if [[ ${CLANG} != "YES" ]]; then
    export CFLAGS+=" -flto -fuse-linker-plugin"
    export CXXFLAGS+=" -flto -fuse-linker-plugin"
  else
    export CFLAGS+=" -flto"
    export CXXFLAGS+=" -flto"
  fi
fi

if [[ ${JIT} == "YES" ]]; then
  makedepends+=("libgccjit-12-dev | libgccjit-11-dev")
  if [[ ${CLI} == "YES" ]]; then
    depends_nox+=("libgccjit0")
  else
    depends+=("libgccjit0")
  fi
fi

# --- Modern feature dependency gates ------------------------------------------
# Placed before the toolkit CLI/GUI split below so a CLI build (which
# re-derives `depends` from `depends_nox`) still picks these up.

# Needs a graphical frame: no-op under CLI, so the dep is skipped there too.
if [[ ${HARFBUZZ} == "YES" && ${CLI} != "YES" ]]; then
  makedepends+=("libharfbuzz-dev")
  depends+=("libharfbuzz0b")
fi

if [[ ${JSON} == "YES" ]]; then
  makedepends+=("libjansson-dev")
  if [[ ${CLI} == "YES" ]]; then
    depends_nox+=("libjansson4")
  else
    depends+=("libjansson4")
  fi
fi

if [[ ${XML2} == "YES" ]]; then
  makedepends+=("libxml2-dev")
  if [[ ${CLI} == "YES" ]]; then
    depends_nox+=("libxml2-16 | libxml2")
  else
    depends+=("libxml2-16 | libxml2")
  fi
fi

if [[ ${GNUTLS} == "YES" ]]; then
  makedepends+=("libgnutls28-dev")
  if [[ ${CLI} == "YES" ]]; then
    depends_nox+=("libgnutls30")
  else
    depends+=("libgnutls30")
  fi
fi

if [[ ${SQLITE3} == "YES" ]]; then
  makedepends+=("libsqlite3-dev")
  if [[ ${CLI} == "YES" ]]; then
    depends_nox+=("libsqlite3-0")
  else
    depends+=("libsqlite3-0")
  fi
fi

# Needs a graphical frame: no-op under CLI, so the dep is skipped there too.
if [[ ${WEBP} == "YES" && ${CLI} != "YES" ]]; then
  makedepends+=("libwebp-dev")
  depends+=("libwebp7 | libwebp6")
fi

# Needs a graphical frame: no-op under CLI, so the dep is skipped there too.
if [[ ${LCMS2} == "YES" && ${CLI} != "YES" ]]; then
  makedepends+=("liblcms2-dev")
  depends+=("liblcms2-2")
fi

if [[ ${NSS} == "YES" ]]; then
  makedepends+=("libnss3-dev")
  if [[ ${CLI} == "YES" ]]; then
    depends_nox+=("libnss3")
  else
    depends+=("libnss3")
  fi
fi

if [[ ${SYSTEMD} == "YES" ]]; then
  makedepends+=("libsystemd-dev")
fi

if [[ ${TREE_SITTER} == "YES" ]]; then
  makedepends+=("libtree-sitter-dev")
  if [[ ${CLI} == "YES" ]]; then
    depends_nox+=("libtree-sitter0")
  else
    depends+=("libtree-sitter0")
  fi
fi

if [[ ${CLI} == "YES" ]]; then
  depends=("${depends_nox[@]}")
elif [[ ${NOTKIT} == "YES" ]]; then
  depends+=("dbus" "hicolor-icon-theme" "libxinerama1" "libxrandr2" "liblcms2-2" "librsvg2-2" "libxfixes3" "libxi6" "libsm6" "libxcb-util1" "libxcb1")
  makedepends+=("x11proto-dev")
elif [[ ${LUCID} == "YES" ]]; then
  depends+=("dbus" "hicolor-icon-theme" "libxinerama1" "libxfixes3" "liblcms2-2" "librsvg2-2" "xaw3dg" "libxrandr2" "libxi6" "libsm6" "libxcb-util1" "libxcb1")
  makedepends+=("x11proto-dev")
elif [[ ${GTK3} == "YES" ]]; then
  depends+=("libgtk-4-1 | libgtk-3-0" "libsm6" "libxcb-util1" "libxcb1")
  makedepends+=("x11proto-dev" "libxi-dev" "libgtk-4-dev | libgtk-3-dev")
elif [[ ${PGTK} == "YES" ]]; then
  depends+=("libgtk-4-1 | libgtk-3-0" "libcairo2" "libsm6")
  makedepends+=("x11proto-dev" "libxi-dev" "libgtk-4-dev | libgtk-3-dev")
fi

if [[ ${CLI} != "YES" ]]; then
  depends+=("libjpeg-turbo8 | libjpeg62-turbo" "libpng16-16" "libgif7" "libtiff6 | libtiff5")
fi

if [[ ${ALSA} == "YES" ]]; then
  depends+=("libasound2" "libatopology2")
fi

if [[ ${NOCAIRO} != "YES" && ${CLI} != "YES" && ${PGTK} != "YES" ]]; then
  depends+=("libcairo2")
fi

if [[ ${XWIDGETS} == "YES" ]]; then
  if [[ ${LUCID} == "YES" || ${NOTKIT} == "YES" || ${CLI} == "YES" ]]; then
    fancy_message error "Xwidgets support *requires* gtk+3!!!"
    exit 1
  else
    depends+=("libwebkit2gtk-4.0-37")
    makedepends+=("libwebkit2gtk-4.0-dev")
  fi
fi

if [[ ${GPM} == "YES" ]]; then
  depends+=("libgpm2")
  makedepends+=("libgpm-dev")
fi

if [[ ${DOCS_PDF} == "YES" ]]; then
  # doc/misc manuals need LaTeX/plain-TeX macros beyond texlive-base (e.g. org, ede).
  makedepends+=("texlive-latex-base" "texlive-latex-recommended" "texlive-fonts-recommended" "texlive-plain-generic")
fi

prepare() {
  cd "${pkgname}~${pkgver}"
  [[ -x configure ]] || (./autogen.sh git && ./autogen.sh autoconf)
}

build() {
  cd "${pkgname}~${pkgver}"
  local _conf=(
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/lib
    --localstatedir=/var
    --mandir=/usr/share/man
    --with-gameuser=:games
    --with-modules
    --without-libotf
    --without-m17n-flt
    # Beware https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25228
    # dconf and gconf break font settings you set in ~/.emacs.
    # If you insist you'll need to read that bug report in *full*.
    # Good luck!
    --without-gconf
  )

  # --- Modern feature toggles -------------------------------------------------
  # Each block below is gated by its corresponding toggle above so users can
  # disable a feature by leaving the variable empty.

  # HarfBuzz shapes glyphs for a GUI frame only; a CLI/TTY build never renders them.
  if [[ ${HARFBUZZ} == "YES" && ${CLI} != "YES" ]]; then
    _conf+=("--with-harfbuzz")
  else
    _conf+=("--without-harfbuzz")
  fi

  if [[ ${JSON} == "YES" ]]; then
    _conf+=("--with-json")
  else
    _conf+=("--without-json")
  fi

  if [[ ${XML2} == "YES" ]]; then
    _conf+=("--with-xml2")
  else
    _conf+=("--without-xml2")
  fi

  if [[ ${GNUTLS} == "YES" ]]; then
    _conf+=("--with-gnutls")
  else
    _conf+=("--without-gnutls")
  fi

  if [[ ${SQLITE3} == "YES" ]]; then
    _conf+=("--with-sqlite3")
  else
    _conf+=("--without-sqlite3")
  fi

  # Image display requires a GUI frame; no-op for a CLI/TTY build.
  if [[ ${WEBP} == "YES" && ${CLI} != "YES" ]]; then
    _conf+=("--with-webp")
  else
    _conf+=("--without-webp")
  fi

  # Color management requires a GUI frame; no-op for a CLI/TTY build.
  if [[ ${LCMS2} == "YES" && ${CLI} != "YES" ]]; then
    _conf+=("--with-lcms2")
  else
    _conf+=("--without-lcms2")
  fi

  if [[ ${NSS} == "YES" ]]; then
    _conf+=("--with-nss")
  else
    _conf+=("--without-nss")
  fi

  if [[ ${SYSTEMD} == "YES" ]]; then
    _conf+=("--with-systemd")
  else
    _conf+=("--without-systemd")
  fi

  if [[ ${TREE_SITTER} == "YES" ]]; then
    _conf+=("--with-tree-sitter")
  else
    _conf+=("--without-tree-sitter")
  fi
  # ---------------------------------------------------------------------------
  if [[ ${CLANG} == "YES" ]]; then
    _conf+=("--enable-autodepend")
  fi

  if [[ ${LTO} == "YES" ]]; then
    _conf+=("--enable-link-time-optimization")
  fi

  if [[ ${JIT} == "YES" ]]; then
    _conf+=("--with-native-compilation=aot")
  fi

  if [[ ${XI2} == "YES" ]]; then
    _conf+=("--with-xinput2")
  fi

  if [[ ${CLI} == "YES" ]]; then
    _conf+=("--without-x" "--with-x-toolkit=no" "--without-xft" "--without-lcms2" "--without-rsvg" "--without-jpeg" "--without-gif" "--without-tiff" "--without-png")
  elif [[ ${NOTKIT} == "YES" ]]; then
    _conf+=("--with-x-toolkit=no" "--without-toolkit-scroll-bars" "--without-xft" "--without-xaw3d")
  elif [[ ${LUCID} == "YES" ]]; then
    _conf+=("--with-x-toolkit=lucid" "--with-xft" "--with-xaw3d")
  elif [[ ${GTK3} == "YES" ]]; then
    _conf+=("--with-x-toolkit=gtk3" "--without-xaw3d")
  elif [[ ${PGTK} == "YES" ]]; then
    _conf+=("--with-pgtk" "--without-xaw3d")
  fi

  if [[ ${PGTK} != "YES" ]]; then
    _conf+=("--without-gsettings")
  fi

  if [[ ${NOCAIRO} == "YES" || ${CLI} == "YES" || ${NOTKIT} == "YES" || ${LUCID} == "YES" ]]; then
    _conf+=("--without-cairo")
  fi

  if [[ ${ALSA} == "YES" ]]; then
    _conf+=("--with-sound=alsa")
  else
    _conf+=("--with-sound=no")
  fi

  if [[ ${XWIDGETS} == "YES" ]]; then
    _conf+=("--with-xwidgets")
  fi

  if [[ ${GPM} != "YES" ]]; then
    _conf+=("--without-gpm")
  fi

  if [[ ${NOGZ} == "YES" ]]; then
    _conf+=("--without-compress-install")
  fi

  # ctags/etags may be provided by other packages, e.g, universal-ctags
  _conf+=("--program-transform-name=s/\([ec]tags\)/\1.emacs/")

  ./configure "${_conf[@]}"

  # Using "make" instead of "make bootstrap" enables incremental
  # compiling. Less time recompiling. Yay! But you may
  # need to use bootstrap sometimes to unbreak the build.
  # Just add it to the command line.
  #
  # Please note that incremental compilation implies that you
  # are reusing your src directory!

  if [[ ${JIT} == "YES" && ${AOT} == "YES" ]]; then
    make -j"${NCPU}" NATIVE_FULL_AOT=1
  else
    make -j"${NCPU}"
  fi

  # You may need to run this if "loaddefs.el" files become corrupt.
  #cd "/usr/pacstall/src/emacs-git/lisp"
  #make autoloads
  #cd "${srcdir}"/

  # Optional documentation formats.
  if [[ ${DOCS_HTML} == "YES" ]]; then
    make -j"${NCPU}" html
  fi
  if [[ ${DOCS_PDF} == "YES" ]]; then
    make -j"${NCPU}" pdf
  fi

}

package() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}" DESTDIR="${pkgdir}" install

  # Install optional documentation formats
  if [[ ${DOCS_HTML} == "YES" ]]; then make -j"${NCPU}" DESTDIR="${pkgdir}" install-html; fi
  if [[ ${DOCS_PDF} == "YES" ]]; then make -j"${NCPU}" DESTDIR="${pkgdir}" install-pdf; fi

  # fix user/root permissions on usr/local/share files
  mkdir -p "${pkgdir}/usr/share/emacs/"
  find "${pkgdir}/usr/share/emacs/" -print0 | xargs -0 chown root:root

  # fix permssions on /var/games
  mkdir -p "${pkgdir}/var/games/emacs"
  chmod 775 "${pkgdir}/var/games"
  chmod 775 "${pkgdir}/var/games/emacs"
}
# vim:set ft=sh ts=2 sw=2 et:
