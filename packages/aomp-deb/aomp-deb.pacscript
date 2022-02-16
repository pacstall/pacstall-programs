name="aomp-deb"
gives="aomp"
version="14.0-2"
depends="libtinfo5"
patch=("https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/aomp-deb/fix_AOMP.patch")
breaks="${gives} ${gives}-git ${gives}-bin ${gives}-app"
url="https://github.com/ROCm-Developer-Tools/aomp/releases/download/rel_${version}/aomp_Ubuntu1804_${version}_amd64.deb"
description="Aomp is AMD's version of compiler Clang."
hash="34abb49981623f7009ce7e06cc7d6aa935c4fbad67e2876e5b58ef72063a63b8"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"

postinst() {
# patch to fix AOMP variable.
patch | sudo tee "/usr/lib/aomp/bin/mymcpu" < "./PACSTALL_patchesdir/fix_AOMP.patch" > /dev/null
}
