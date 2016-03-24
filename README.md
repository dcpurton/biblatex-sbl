# biblatex-sbl
Society of Biblical Literature, 2nd Edition (SBL) style files for Biblatex

## State

Most types of notes and bibliographies are supported. However, the style should not be considered production ready.

## Documentation

See `doc/biblatex-sbl.pdf` for style documentation and `doc/biblatex-sbl-test.pdf` for example entries from the 2nd edition of the SBL Handbook of Style.

## Testing

The main test files are `doc/biblatex-sbl-test.tex` and `doc/biblatex-sbl.bib`

To test in place:

* Add the path to the style files to your search path:

    ```
    export TEXINPUTS="../latex/:"     # (under UNIX)
    ```

* You should be able to then run:

    ```
    lualatex biblatex-sbl-test
    biber biblatex-sbl-test
    lualatex biblatex-sbl-test
    lualatex biblatex-sbl-test
    makeindex biblatex-sbl-test
    lualatex biblatex-sbl-test
    ```

* `biblatex-sbl-test.pdf` contains all examples in the 2nd edition of the SBL Handbook of Style.

## Installing

Put the contents of the `latex` directory into `$TEXMFHOME/tex/latex/biblatex-sbl/`

Put the contents of the `doc` directory into `$TEXMFHOME/doc/latex/biblatex-sbl/`

You can find `$TEXMFHOME` by running:

```        
kpsewhich -var-value=TEXMFHOME
```

## Requirements

The following packages are required:

* biblatex (version 3.0 or higher)
    - **Note:** `biber` 2.4 (which is used with `biblatex` 3.3) contains a bug which causes it to fail processing entries with both a `shorthand` and a `shortseries`.
* xparse

## Licence

```
Copyright 2015-2016 David Purton

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
    http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work has the LPPL maintenance status `maintained'.

The Current Maintainer of this work is David Purton.
```
