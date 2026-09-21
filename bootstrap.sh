#!/usr/bin/env bash
set -euo pipefail

echo "Cleaning up..."
make clean
rm -rf tags

echo "Building debug target (with symbols/lists)..."
make debug

echo "Generating Ctags..."
ctags -R .

TARGET=$(make print-target)

echo ""
echo "Generated:"
echo "- $TARGET"
echo "- build/obj/"
echo "- tags"
echo "Done"
