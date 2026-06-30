# Squad Leader — Reglamento en castellano

Traducción de aficionado al castellano del reglamento de **Squad Leader** (Avalon Hill,
1977; diseño de John Hill), más material didáctico original para aprender a jugar.

🌐 **Web:** <https://asantolaria.github.io/squad-leader/>

| | |
|---|---|
| **Reglamento** (página principal) | <https://asantolaria.github.io/squad-leader/> |
| **Aprende a jugar** (extras) | <https://asantolaria.github.io/squad-leader/extra/> |

> ### ⚖️ Aviso
> Traducción **no oficial** y **sin ánimo de lucro**, hecha por un aficionado. Todos los
> derechos del juego, sus reglas, textos e ilustraciones pertenecen a sus titulares (hoy
> propiedad de Hasbro, con licencia de Multi-Man Publishing). Es una ayuda de juego para
> quien **posee una copia original**; no la sustituye. Para los valores exactos, consulta
> siempre tus cartas y tablas originales. Si algún titular de derechos desea su retirada,
> se hará de inmediato.

---

## Estructura del sitio

- **`/` (raíz)** — el reglamento completo, troceado en 12 capítulos temáticos, con
  diagramas propios, referencias de regla enlazadas y anclas estables por número
  (p. ej. `…/05-blindados/#r33`).
- **`/extra/`** — material didáctico original (palabras propias): jugar en solitario,
  dos escenarios de práctica comentados, referencia rápida de mesa y recursos.

## Estructura del repositorio

```
extra/             Material didáctico (versionado) — se publica en /extra/
  assets/          Diagramas SVG propios + fotos de dominio público (US Gov),
                   reutilizados también por el reglamento (web y PDF)
  _borrador-guia/  Capítulos didácticos antiguos, archivados y sin publicar
mkdocs.yml         Config de los extras (/extra/)
deploy.sh          Construye y publica ambas partes en la rama gh-pages
requirements.txt   mkdocs-material

reglamento/        NO versionado (.gitignore) — traducción literal y herramientas
                   reglamento-es.md, partes, mkdocs.yml, _build/,
                   build.py (web), pdf.sh/build_pdf.py (PDF reglamento),
                   build_pdf_extra.py (PDF extras),
                   reglamento-es.pdf, aprende-a-jugar.pdf
```

El contenido de `reglamento/` (la traducción literal y los escaneos del original) **no
forma parte del repositorio**: está en `.gitignore`. Solo el sitio ya construido se
publica en la rama `gh-pages`.

## Construir y desplegar

Requisitos: Python con `mkdocs-material` y `ghp-import` (ver `requirements.txt`).

```bash
./deploy.sh
```

Construye el reglamento en `site/` (raíz) y los extras en `site/extra/`, y sube el
conjunto a la rama `gh-pages` con `ghp-import`.

> **Autenticación:** este repo está configurado (credential helper **local**, en
> `.git/config`, no versionado) para que git use siempre la cuenta `asantolaria` vía el
> PAT guardado en `gh`, **sin** cambiar la cuenta activa global ni guardar el token en
> texto plano. Así `./deploy.sh` y `git push` funcionan aunque la cuenta `gh` activa sea
> otra. Si reclonas el repo, reconfigúralo una vez:
> ```bash
> git config --local credential.helper ""
> git config --local --add credential.helper \
>   '!f() { printf "username=asantolaria\npassword=%s\n" "$(gh auth token --user asantolaria)"; }; f'
> ```

Para previsualizar en local:

```bash
mkdocs serve -f reglamento/mkdocs.yml   # reglamento (raíz)
mkdocs serve -f mkdocs.yml              # extras
```

## PDFs

Se generan con pandoc + xelatex (quedan en `reglamento/`, privados). Los SVG se
rasterizan con `google-chrome` (xelatex no incrusta SVG):

```bash
reglamento/pdf.sh               # -> reglamento/reglamento-es.pdf   (reglamento, con fotos/diagramas/enlaces)
reglamento/build_pdf_extra.py   # -> reglamento/aprende-a-jugar.pdf (extras; obra propia, compartible)
```

Requiere `pandoc`, un motor LaTeX (`xelatex`), la fuente DejaVu y `google-chrome`.
