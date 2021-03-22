=======================================
Command line tools for bibtex citations
=======================================

:Author: Bjoern Bastian <bjoern.bastian@uibk.ac.at>
:Date: 2019-11-26

This projects contains several shell scripts for the following tasks.

-   Generate file names and citation keys
-   Format bibtex files
-   Abbreviate journal names
-   Insert links to pdf files for JabRef
-   Manage multi record bibtex files
-   Extract single records
-   Output text citations for copy and paste

.. contents::

The html version of this file is created with ``python-docutils``::

    make README.html

Usage
=====
See online documentation in `bibtools.pdf`_ or build ``doc/bibtools.pdf``
yourself with ``make doc``.

Setup on Linux
==============
- GNU AWK is required.  For Ubuntu you may install the ``gawk`` package::

    sudo apt-get install gawk

- Install scripts to ``$HOME/bin``::

    make install

- Run all or selected tests::

    make test # all tests
    ./test/test_runner pattern...

  with one or more filter patterns containing the wildcard ``*``.  Otherwise,
  usual regular expressions are supported, for example ``testJournal[UD]*``.

- To uninstall, remove scripts from ``$HOME/bin``::

    make uninstall

Notes on the BibTeX format
==========================
- BibTeX entries are formatted in a unique way with sorted tags (field names)
  and contents enclosed in curly braces.
- Tags must start with a letter from the English alphabet and otherwise may
  only contain the additional characters ``-`` and ``_``.
- New BibTeX files may enclose contents in quotation marks, but string
  concatenation with ``#`` is not supported.

Related
=======
- The ``bin/ris2bib`` is a command line interface to convert RIS files to
  BibTeX format using the `ris2bib`_ online converter by Nicolas Bruot.

.. _bibtools.pdf: https://bop.uber.space/files/bibtools/bibtools.pdf
.. _ris2bib: https://www.bruot.org/ris2bib/
