name="geekbench-bin"
gives="geekbench"
version="5.4.1"
url="https://cdn.geekbench.com/Geekbench-${version}-Linux.tar.gz"
description="Geekbench is a cross-platform benchmark that measures your system's performance with the press of a button"
hash="d0f83d6c7430584956e01de845ca3917616c68478b0b4657c7b27e865edd7376"

prepare(){
	true
}

build(){
	true
}

install(){
	sudo install -Dm755 "${gives}5" -t "$STOWDIR/$name/opt/$gives"
	sudo install -Dm755 "${gives}_x86_64" -t "$STOWDIR/$name/opt/$gives"
	sudo install -Dm644 "${gives}.plar" -t "$STOWDIR/$name/opt/$gives/"
	sudo mkdir -p "$STOWDIR/$name/usr/bin"
	cd "$STOWDIR/$name/usr/bin"
	sudo rm "${gives}5" 2> /dev/null
	sudo ln -s "../../opt/$gives/${gives}5" "${gives}5"
}
