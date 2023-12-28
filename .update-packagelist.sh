#!/bin/bash
set -eu

# override collation to ensure locale-independent sort order
LC_COLLATE=C ls -1 packages/ > packagelist
