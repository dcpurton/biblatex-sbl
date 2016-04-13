# biblatex-sbl — SBL style files for biblatex

This package provides biblatex support for citations in the format specified by the second edition of the Society of Biblical Literature (SBL) Handbook of Style.

All example notes and bibliography entries from the handbook are supported.

## Documentation

* `biblatex-sbl.pdf`: Style usage and documentation summary.
* `biblatex-sbl.bib`: Database entries for all example citations in the handbook.
* `biblatex-sbl-test.pdf`: Example usage for all example citations in the handbook.
* `biblatex-sbl-ibid.pdf`: Example usage of *ibidem* and *idem* settings.

## Manual Installation

* Copy `biblatex-sbl.def`, `sbl.cbx`, `sbl.bbx`, `sbl.dbx`, and `*.lbx` into `$TEXMFHOME/tex/latex/biblatex-sbl/`
* Copy `*.pdf` into `$TEXMFHOME/doc/latex/biblatex-sbl/`
* Copy `biblatex-sbl.bib` into `$TEXMFHOME/bibtex/bib/biblatex-sbl/`

You can find `$TEXMFHOME` by running:

```        
kpsewhich -var-value=TEXMFHOME
```

## Requirements

The following packages are required:

* `biblatex` (version 3.1 or higher) with the `biber` backend
    - **Note:** `biber` 2.4 (which is used with `biblatex` 3.3) contains a bug which causes it to fail processing entries with both a `shorthand` and a `shortseries`.
* `xparse`

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
