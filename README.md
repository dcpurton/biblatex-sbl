# biblatex-sbl — SBL style files for biblatex

This package provides `biblatex` support for citations in the format specified
by the second edition of the Society of Biblical Literature (SBL) Handbook of
Style including updates on the SBLHS Blog (https://sblhs2.com/).

All example notes and bibliography entries from the handbook, student
supplement and blog are supported. Posts from the blog supersede the handbook
and student supplement and more recent blog posts supersede older blog posts.

## Documentation

* `biblatex-sbl.pdf`: Style usage and documentation summary.
* `biblatex-sbl.bib`: Database entries for all example citations in the
  handbook and on the blog
* `biblatex-sbl-blog-examples.pdf`: Example usage for all example citations on the blog.
* `biblatex-sbl-handbook-examples.pdf`: Example usage for all example
  citations in the handbook.
* `biblatex-sbl-studentsupplement-examples.pdf`: Example usage for all example
  citations in the student supplement to the handbook.

## Installation from TeXLive, or MiKTeX

It is also in TeXLive and MiKTeX and can be installed in the usual way through
your distribution. E.g., in TeXLive by running:

```
tlmgr install biblatex-sbl
```

## Installation from Git source

`biblatex-sbl` uses the `l3build` system.

Clone the git repository using:

```
git clone https://github.com/dcpurton/biblatex-sbl.git
```

Change to the `biblatex-sbl` directory and the style files and documentation
can be installed by running:

```
l3build install --full
```

**Note:** The documentation uses several fonts not found in a standard TeXLive
installation. You will need to download and install:

- The SBL biblical fonts available from
  https://www.sbl-site.org/resources/fonts/
- The Brill fonts available from
  https://brill.com/page/resources_brilltypeface/brill-typeface
- Estrangelo Edessa available in the Meltho font bundle at
  https://bethmardutho.org/
- Miriam Libre available from https://fonts.google.com/specimen/Miriam+Libre
- Noto Serif Armenian available from
  https://fonts.google.com/noto/specimen/Noto+Serif+Armenian
- Noto Sans Syriac available from
  https://fonts.google.com/noto/specimen/Noto+Sans+Syriac

## Backwards compatibility

The [*SBL Handbook of Style* blog](https://sblhs2.com/) has now made SBL style a rolling style that changes with each blog
post. Because of this, preserving backward compatibility between releases is
not feasible for time I have available to maintain this style and neither is
it possible to provide options to vary the style to cater for different
seminaries and theological colleges.

**In particular, version 2.0 and later of `biblatex-sbl` completely breaks
compatibility with the version 0.x releases.** If you need to access a legacy
release, you should download it from the GitHub repository and place the style
files locally in your project. See
https://github.com/dcpurton/biblatex-sbl/releases for legacy releases and
https://github.com/dcpurton/biblatex-sbl/tree/legacy for legacy source code.
Legacy 0.x versions are no longer maintained or supported.

## Licence

```
Copyright 2015-2026 David Purton

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
