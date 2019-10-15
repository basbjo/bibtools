=======================================
Command line tools for bibtex citations
=======================================

:Author: Bjoern Bastian <bjoern.bastian@uibk.ac.at>
:Date: 2019-09-09

This projects contains several shell scripts for the following tasks.

-   Generate file names and citation keys
-   Format bibtex files
-   Abbreviate journal names
-   Insert links to pdf files for JabRef
-   Manage multi record bibtex files
-   Extract single records
-   Output text citations for copy and paste

The html version of this file is created with ``python-docutils``::

    make README.html

Usage
=====

See online documentation in `bibtools.pdf`_ or build ``doc/bibtools.pdf``
yourself with ``make doc``.

Setup
=====
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

.. _bibtools.pdf: https://bbastian.pavo.uberspace.de/files/bibtools/bibtools.pdf
