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
<<<<<<< HEAD
	sudo install -Dm755 "waf" "$STOWDIR/$name/home/$LOGNAME/.local/bin/waf"
	sudo install -dm755 "$STOWDIR/$name/usr/lib"
	sudo cp -r "./waflib" "$STOWDIR/$name/usr/lib"
	sudo python3 -m compileall "$STOWDIR/$name/usr/lib/waflib"
=======
	sudo install -Dm755 "waf" "$STOWDIR/$name/usr/bin/waf"
}

postinst() {
	sudo waf 2>"/dev/null"
>>>>>>> cb45b97547c3f2dda4e8e07f49dfa28e75509e80
}
