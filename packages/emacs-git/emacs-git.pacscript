#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <basak.sb2006@gmail.com>"

### This pacscript is made with (ported to pacstall) the help of https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=emacs-git
################################################################################
# Assign "YES" to the variable you want enabled; empty or any other value
# for NO.
#
# Where you read experimental, replace with foobar.
# =================================================
#
################################################################################
CHECK=            # Run tests. May fail, this is developement after all.
CLANG=            # Use clang.
GOLD=             # Use the gold linker.
LTO="YES"         # Enable link-time optimization. Read emacs's INSTALL before
                  # attempting to use it with clang.
JIT=              # Enable native just-in-time compilation.
                  # This compiles only performance critical elisp files.
                  # To compile all elisp on demand, set
                  # comp-deferred-compilation non-nil
AOT=              # Precompile all included elisp. It takes a long time.
                  # You still need to enable on-demand compilation
                  # for your own packages.
CLI=              # CLI only binary.
NOTKIT=           # Use no toolkit widgets. Like B&W Twm (001d sk00l).
LUCID=            # Use the lucid, a.k.a athena, toolkit. Like XEmacs, sorta.
                  #
                  # Read https://wiki.archlinux.org/index.php/X_resources
                  # https://en.wikipedia.org/wiki/X_resources
                  # and https://www.emacswiki.org/emacs/XftGnuEmacs
                  # for some tips on using outline fonts with
                  # Xft, if you choose no toolkit or Lucid.
                  #
GTK2=             # GTK2 support. Why would you?
NOCAIRO=          # Disable here. 
XWIDGETS=         # Use GTK+ widgets pulled from libwebkit2gtk-4.0-37. Usable.
DOCS_HTML=        # Generate and install html documentation.
DOCS_PDF=         # Generate and install pdf documentation.
MAGICK=           # ImageMagick 7 support. Deprecated (read the logs).
                  # ImageMagick, like flash, won't die... 
                  # -->>If you just *believe* you need ImageMagick, you don't.<<--
NOGZ="YES"        # Don"t compress .el files.
################################################################################

name="emacs-git"
version="20062021"
url="https://github.com/emacs-mirror/emacs.git"
description="An extensible, customizable, free/libre text editor — and more."
build_depends="git autoconf texinfo"
depends_nox="libalsaplayer0 libgnutls28-dev libxml2 libjansson-dev gpm"
depends="${depends_nox} m17n-lib-bin libotf0 libharfbuzz0b"
gives="${name} emacs emacs-nox"
breaks="emacs emacs-nox"
replace="emacs"

if [[ $GOLD == "YES" && ! $CLANG == "YES" ]]; then
  export LD=/usr/bin/ld.gold
  export CFLAGS+=" -fuse-ld=gold"
  export CXXFLAGS+=" -fuse-ld=gold"
elif [[ $GOLD == "YES" && $CLANG == "YES" ]]; then
  fancy_message error "Clang rather uses its own linker."
  exit 1
fi
if [[ $CLANG == "YES" ]]; then
  export CC="/usr/bin/clang"
  export CXX="/usr/bin/clang++"
  export CPP="/usr/bin/clang -E"
  export LD="/usr/bin/lld"
  export AR="/usr/bin/llvm-ar"
  export AS="/usr/bin/llvm-as"
  export CCFLAGS+=" -fuse-ld=lld"
  export CXXFLAGS+=" -fuse-ld=lld"
  build_depends+=" clang lld llvm"
fi
if [[ $LTO == "YES" ]]; then
  if [[ $CLANG != "YES" ]]; then
  CFLAGS+=" -flto -fuse-linker-plugin"
  CXXFLAGS+=" -flto -fuse-linker-plugin"
else
  CFLAGS+=" -flto"
  CXXFLAGS+=" -flto"
  fi
fi

if [[ $JIT == "YES" ]]; then
  if [[ $CLI == "YES" ]]; then
    depends_nox+=" libgccjit0" 
  else
    depends+=" libgccjit0"
  fi
fi

if [[ $CLI == "YES" ]]; then
  depends="${depends_nox}"
elif [[ $NOTKIT == "YES" ]]; then
  depends+=" dbus hicolor-icon-theme libxinerama1 libxrandr2 liblcms2-2 librsvg2-2 libxfixes3"
  build_depends+=" x11proto-dev"
elif [[ $LUCID == "YES" ]]; then
  depends+=" dbus hicolor-icon-theme libxinerama1 libxfixes3 liblcms2-2 librsvg2-2 xaw3dg libxrandr2"
  build_depends+=" x11proto-dev"
elif [[ $GTK2 == "YES" ]]; then
  depends+=" libgtk2.0-0 liblcms2-2"
  build_depends+=" x11proto-dev"
else
  depends+=" libgtk3.0-cil"
  build_depends+=" x11proto-dev"
fi

if [[ $MAGICK == "YES" ]]; then
  depends+=" imagemagick libjpeg-turbo8 giflib-tools"
elif [[ ! $NOX == "YES" ]] && [[ ! $CLI == "YES" ]]; then
  depends+=" libjpeg-turbo8 giflib-tools"
elif [[ $CLI == "YES" ]]; then
  depends+=""
fi

if [[ ! $NOCAIRO == "YES" ]] && [[ ! $CLI == "YES" ]]; then
  depends+=" libcairo2"
fi

if [[ $XWIDGETS == "YES" ]]; then
  if [[ $GTK2 == "YES" ]] || [[ $LUCID == "YES" ]] || [[ $NOTKIT == "YES" ]] || [[ $CLI == "YES" ]]; then
    fancy_message error "Xwidgets support *requires* gtk+3!!!"
    exit 1
  else
    depends+=" libwebkit2gtk-4.0-37"
  fi
fi
 if [[ $DOCS_PDF == "YES" ]]; then
  build_depends+=" texlive-base"
fi

prepare() {
  [[ -x configure ]] || ( ./autogen.sh git && ./autogen.sh autoconf )
  if [[ $CHECK == "YES" ]]; then
    make -j"$(nproc)" check
  fi
 }

build() {
  local _conf=(
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/lib
    --localstatedir=/var
    --mandir=/usr/share/man
    --with-gameuser=:games
    --with-sound=alsa
    --with-modules
# Beware https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25228
# dconf and gconf break font settings you set in ~/.emacs.
# If you insist you'll need to read that bug report in *full*.
# Good luck!
   --without-gconf
   --without-gsettings
  )

  if [[ $CLANG == "YES" ]]; then
    _conf+=( '--enable-autodepend' )
  fi

  if [[ $LTO == "YES" ]]; then
    _conf+=( '--enable-link-time-optimization' )
  fi

  if [[ $JIT == "YES" ]]; then
    _conf+=( '--with-native-compilation' )
  fi

  if [[ $CLI == "YES" ]]; then
    _conf+=( '--without-x' '--with-x-toolkit=no' '--without-xft' '--without-lcms2' '--without-rsvg' '--without-jpeg' '--without-gif' '--without-tiff' '--without-png' )
  elif [[ $NOTKIT == "YES" ]]; then
    _conf+=( '--with-x-toolkit=no' '--without-toolkit-scroll-bars' '--with-xft' '--without-xaw3d' )
  elif [[ $LUCID == "YES" ]]; then
    _conf+=( '--with-x-toolkit=lucid' '--with-xft' '--with-xaw3d' )
  elif [[ $GTK2 == "YES" ]]; then
    _conf+=( '--with-x-toolkit=gtk2' '--without-gsettings' '--without-xaw3d' )
  else
    _conf+=( '--with-x-toolkit=gtk3' '--without-xaw3d' )
  fi

  if [[ $MAGICK == "YES" ]]; then
    _conf+=( '--with-imagemagick')
  else
    _conf+=();
  fi

  if [[ $NOCAIRO == "YES" || $CLI == "YES" ]]; then
    _conf+=( '--without-cairo' )
  fi

  if [[ $XWIDGETS == "YES" ]]; then
    _conf+=( '--with-xwidgets' )
  fi

  if [[ $NOGZ == "YES" ]]; then
    _conf+=( '--without-compress-install' )
  fi

  # ctags/etags may be provided by other packages, e.g, universal-ctags
  _conf+=('--program-transform-name=s/\([ec]tags\)/\1.emacs/')

  ./configure "${_conf[@]}"

  # Using "make" instead of "make bootstrap" enables incremental
  # compiling. Less time recompiling. Yay! But you may
  # need to use bootstrap sometimes to unbreak the build.
  # Just add it to the command line.
  #
  # Please note that incremental compilation implies that you
  # are reusing your src directory!

  if [[ $JIT == "YES" ]] && [[ $AOT == "YES" ]]; then
    make -j"${nproc}" NATIVE_FULL_AOT=1
  else
    make -j"${nproc}"
  fi

  # You may need to run this if 'loaddefs.el' files become corrupt.
  #cd "/usr/pacstall/src/emacs-git/lisp"
  #make autoloads
  #cd ../

  # Optional documentation formats.
  if [[ $DOCS_HTML == "YES" ]]; then
    make -j"${nproc}" html
  fi
  if [[ $DOCS_PDF == "YES" ]]; then
    make -j"${nproc}" pdf
  fi

}

install() {
  sudo make -j"${nproc}" DESTDIR="/usr/src/pacstall/${name}" install

  # Install optional documentation formats
  if [[ $DOCS_HTML == "YES" ]]; then make -j"${nproc}" DESTDIR="/usr/src/pacstall/${name}/" install-html; fi
  if [[ $DOCS_PDF == "YES" ]]; then make -j"${nproc}" DESTDIR="/usr/src/pacstall/${name}/" install-pdf; fi
}

postinst() {
  # fix user/root permissions on usr/local/share files
  find /usr/src/pacstall/"${name}"/usr/local/share/emacs/ -print0 | xargs -0 chown root:root

  # fix permssions on /var/games
  mkdir -p /usr/src/pacstall/"${name}"/var/games/emacs
  chmod 775 /usr/src/pacstall/"${name}"/var/games
  chmod 775 /usr/src/pacstall/"${name}"/var/games/emacs
  chown -R root:games /usr/src/pacstall/"${name}"/var/games
}
