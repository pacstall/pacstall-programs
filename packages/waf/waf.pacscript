name="waf"
version="2.0.24"
url="https://gitlab.com/ita1024/waf/-/archive/waf-$version/waf-waf-$version.zip"
description="Waf is a Python-based framework for configuring, compiling and installing applications."
hash="87a468f9bf1d8a55151dda6290e230bcdad199df70217a223eb96ac79b94f121"
maintainer="echometerain <echometer@disroot.org>"

prepare() {
  true
}

build() {
  python3 ./waf-light build --make-waf --tools='compat,compat15,ocaml,go,cython,scala,erlang,cuda,gcj,boost,pep8,eclipse'
}

install() {
  sudo install -Dm755 "waf" "$STOWDIR/$name/usr/bin/waf"
}

postinst() {
  sudo waf 2> "/dev/null"
}
