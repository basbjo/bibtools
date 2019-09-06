Command line tools for bibtex citations
=======================================

-   Generate file names and citation keys
-   Format bibtex files
-   Abbreviate journal names
-   Insert links to pdf files for JabRef
-   Manage multi record bibtex files
-   Extract single records
-   Output text citations for copy and paste

The html version of this file is created with `pandoc` and `python-docutils`:

    make README.html

Author

:   Bjoern Bastian

Date

:   2019-08-06

Usage
-----

See online documentation in
[bibtools.pdf](https://bbastian.pavo.uberspace.de/files/bibtools/bibtools.pdf)
or build `doc/bibtools.pdf` yourself with `make doc`.

Setup
-----
GNU AWK is required.  For Ubuntu you may install the `gawk` package:

    sudo apt-get install gawk

Install scripts to `$HOME/bin`:

    make install

Run all or selected tests:

    make test # all tests
    ./test/test_runner pattern...

  With one or more filter patterns containing the wildcard `*`.  Otherwise,
  usual regular expressions are supported, for example `testJournal[UD]*`.

Remove scripts from `$HOME/bin`:

    make uninstall
