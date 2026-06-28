# Guía de Squad Leader (en castellano)

Guía didáctica original para aprender a jugar a **Squad Leader** (Avalon Hill, 1977, diseño
de John Hill) y sus módulos (*Cross of Iron*, *Crescendo of Doom*, *GI: Anvil of Victory*).

📖 **Web publicada:** https://asantolaria.github.io/squad-leader/

> Esta guía explica **con palabras propias** cómo funcionan las mecánicas del juego (reglas,
> secuencia, procedimientos) y **no reproduce** el reglamento original ni sus tablas
> numéricas, que están protegidas por derechos de autor. Para los valores exactos usa tus
> propias cartas/tablas del juego. Es material de aprendizaje, no una copia del manual.

## Contenido

El contenido vive en [`docs/`](docs/) como Markdown:

1. Introducción y componentes
2. Secuencia de juego
3. Movimiento
4. Fuego y combate
5. Moral y liderazgo
6. Terreno y edificios
7. Blindados y vehículos
8. Cañones y armas de apoyo
9. Módulos y reglas avanzadas
10. Referencia rápida
11. Glosario y siglas

## Cómo ver la web en local

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve          # http://127.0.0.1:8000
```

## Cómo publicar / actualizar la web

El sitio se publica en GitHub Pages (rama `gh-pages`) con:

```bash
mkdocs gh-deploy
```

Cada vez que edites un `.md` de `docs/`, vuelve a ejecutar ese comando para actualizar la
web.

## Licencia

Texto de la guía: material original del autor. *Squad Leader* y sus módulos son marca y obra
con copyright de sus titulares (Avalon Hill / Hasbro / Wizards of the Coast / Multi-Man
Publishing).
