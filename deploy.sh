#!/usr/bin/env bash
# Despliega a GitHub Pages (rama gh-pages) un único sitio con dos partes:
#   /squad-leader/         -> Reglamento ES (página principal, reglamento/, NO está en git)
#   /squad-leader/extra/   -> Aprende a jugar: escenarios, solitario… (extra/, público en git)
#
# El reglamento se construye PRIMERO porque su site_dir es site/ (raíz) y lo limpia;
# los extras después en site/extra/. Luego se sube el conjunto con ghp-import.
set -euo pipefail
cd "$(dirname "$0")"

VENV=.venv/bin
MKDOCS="$VENV/mkdocs"
GHP="$VENV/ghp-import"

echo "==> 1/4  Preparando reglamento publicable (reglamento/_build)…"
"$VENV/python" reglamento/build.py

echo "==> 2/4  Construyendo el reglamento (página principal)  -> site/"
"$MKDOCS" build --clean --strict -f reglamento/mkdocs.yml

echo "==> 3/4  Construyendo las secciones extra              -> site/extra/"
"$MKDOCS" build --clean --strict -f mkdocs.yml

echo "==> 4/4  Publicando site/ en la rama gh-pages…"
# -n: añade .nojekyll  -p: push a origin  -f: fuerza  -r/-b: remoto y rama
"$GHP" -n -p -f -r origin -b gh-pages site

echo ""
echo "Hecho. En 1-2 min:"
echo "  Reglamento (home): https://asantolaria.github.io/squad-leader/"
echo "  Aprende a jugar:   https://asantolaria.github.io/squad-leader/extra/"
