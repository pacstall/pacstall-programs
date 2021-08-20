name="waf-git"
version="2.0.22"
url="https://gitlab.com/ita1024/waf/-/archive/waf-$version/waf-waf-$version.zip"
description="Waf is a Python-based framework for configuring, compiling and installing applications."
hash="533d5e8826bae3859240f1e8ae1ce92140c98baa4dbf6f9ee9e39a07bb6501db"
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
	sudo waf 2>"/dev/null"
}
