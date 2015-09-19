# biblatex-sbl
Society of Biblical Literature, 2nd Edition (SBL) style files for Biblatex

State:

    *very* alpha

Testing:

    The main test files are docs/sblref.tex and docs/sbl.bib

    To test in place:
        add the path to the style files to your search path:
            export TEXINPUTS="../latex/:"     # (under UNIX)

        You should be able to then run:
            xetex sblref
            biber sblref
            xetex sblref
            biber sblref
            xetex sblref
        to get a clean build of sblref.pdf

        sblref.pdf contains most of the examples in the 2nd edition of the SBL
        Handbook of Style

Installing:

    Put the contents of the latex directory into
        $TEXMFHOME/tex/latex/biblatex-sbl/

    You can find $TEXMFHOME by running:
        kpsewhich -var-value=TEXMFHOME

Licence:

    Copyright 2015 David Purton

    This work may be distributed and/or modified under the
    conditions of the LaTeX Project Public License, either version 1.3
    of this license or (at your option) any later version.
    The latest version of this license is in
        http://www.latex-project.org/lppl.txt
    and version 1.3 or later is part of all distributions of LaTeX
    version 2005/12/01 or later.

    This work has the LPPL maintenance status `maintained'.

    The Current Maintainer of this work is David Purton.

