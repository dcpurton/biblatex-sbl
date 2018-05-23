# biblatex-sbl — SBL style files for biblatex

This package provides biblatex support for citations in the format specified by the second edition of the Society of Biblical Literature (SBL) Handbook of Style.

All example notes and bibliography entries from the handbook are supported.

## Documentation

* `biblatex-sbl.pdf`: Style usage and documentation summary.
* `biblatex-sbl.bib`: Database entries for all example citations in the handbook.
* `biblatex-sbl-examples.pdf`: Example usage for all example citations in the handbook.
* `biblatex-sbl-ibid.pdf`: Example usage of *ibidem* and *idem* settings.
* `sbl-paper.sty`: A style file for papers matching the Student Supplement to the SBLHS.
* `sbl-paper.tex`: An example paper using `sbl-paper.sty`.
* `sbl-paper-bibleref.ist`: An index style file for printing a Scripture Reference Index (used with `sbl-paper.tex`).

## Installation from CTAN, TeXLive, or MiKTeX

`biblatex-sbl` is available in CTAN at https://www.ctan.org/pkg/biblatex-sbl

It is also in TeXLive and MiKTeX and can be installed in the usual way through your distribution.

## Installation from Git Source

```
git clone https://github.com/dcpurton/biblatex-sbl.git
cd biblatex-sbl
make install
```

## Manual Installation

* Copy `sbl-paper.sty`, `biblatex-sbl.def`, `sbl.cbx`, `sbl.bbx`, `sbl.dbx`, and `*.lbx` into `$TEXMFHOME/tex/latex/biblatex-sbl/`
* Copy `*.pdf`, `biblatex-sbl.bib`, and `sbl-paper.tex` into `$TEXMFHOME/doc/latex/biblatex-sbl/`
* Copy `sbl-paper-bibleref.ist` into `$TEXMFHOME/makeindex/biblatex-sbl/`

You can find `$TEXMFHOME` by running:

```        
kpsewhich -var-value=TEXMFHOME
```

## Requirements

The following packages are required:

* `biblatex` (version 3.11 or higher) with the `biber` backend
* `xparse`

## Licence

```
Copyright 2015-2018 David Purton

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
