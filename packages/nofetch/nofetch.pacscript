name="nofetch"
version="1.0"
url="https://github.com/jnats/nofetch/archive/refs/tags/v1.0.zip"
depends="bash sed head cat"
description="The simple man's fetch tool"
hash="92e1d4b047b2f5c5ba99d2afa922a65004321cd7930027183ee8c57d393cbb78"

install() {
   chmod +x nofetch
   mv nofetch /usr/src/pacstall/nofetch 
}