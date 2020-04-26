# eopkg-audit

`eopkg-audit` is a command-line utility which audits system files against the `eopkg` database to find discrepancies such as added or deleted files. The existing `eopkg check` utility can detected deleted or modified files, but does not search system directories to find files that were manually added outside of `eopkg`.

This command should work much faster than `eopkg check` as it doesn't compare the contents of each file to check for modification.

### Installation

`eopkg-audit` is a one-file script. Run `make install` using the provided Makefile to install it to the system. The PREFIX variable is honored. To install to your home directory bin folder, run `make PREFIX=$HOME install`.

### Output

- Any file recorded in the eopkg database not found in the system is prefixed with "-"
- Any file found in the system directories not recorded in the eopkg database is prefixed with "+"

### Usage

```text
usage: eopkg-audit [-h] [-a] [-d] [-c CONFIG] [-i PATH] [-I PATTERN]
                   [--dump-config]
                   [paths [paths ...]]

Audits system files against the eopkg database, showing files that have been
manually added or deleted in any directory eopkg has installed to.

positional arguments:
  paths                 list of directories to search

optional arguments:
  -h, --help            show this help message and exit
  -a, --added           show only system files that are added outside of eopkg
  -d, --deleted         show only system files that are deleted outside of
                        eopkg
  -c CONFIG, --config CONFIG
                        path to optional configuration file
  -i PATH, --ignore PATH
                        path to a file or directory to ignore (may be given
                        multiple times; if a directory is given, all files and
                        subdirectories beneath it will be ignored)
  -I PATTERN, --ignore-pattern PATTERN
                        regular expression pattern to ignore matches
  --dump-config         dump the default config JSON (useful for writing your
                        own config file)

A configuration file can be specified by argument or will automatically be
read from ~/.config/eopkg-audit/config.json. Use the --dump-config switch to
dump the default configuration, save it to the default config location, and
modify as needed. The configuration file should consist of a JSON dict with
the following key-value pairs. 'ignore': list of paths; 'ignore_pattern': list
of patterns
```

### Dependencies

This should be usable on any Solus machine, provided that `eopkg` works.
