#!/usr/bin/bash
set -eu

tmp=$(mktemp)
# override collation to ensure locale-independent sort order
LC_COLLATE=C ls -1 packages/ > "${tmp}"
diff packagelist "${tmp}"
