# clib

  [![Build Status](https://travis-ci.org/clibs/clib.svg?branch=master)](https://travis-ci.org/clibs/clib)
  [![Codacy Badge](https://app.codacy.com/project/badge/Grade/a196ec36c31349e18b6e4036eab1d02c)](https://www.codacy.com/gh/clibs/clib?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=clibs/clib&amp;utm_campaign=Badge_Grade)

  Package manager for the C programming language.

  ![c package manager screenshot](https://i.cloudup.com/GwqOU2hh9Y.png)

## Usage

```
  clib <command> [options]

  Options:

    -h, --help     Output this message
    -V, --version  Output version information

  Commands:

    init                 Start a new project
    i, install [name...] Install one or more packages
    up, update [name...] Update one or more packages
    upgrade [version]    Upgrade clib to a specified or latest version\
    configure [name...]  Configure one or more packages
    build [name...]      Build one or more packages
    search [query]       Search for packages
    help <cmd>           Display help for cmd
```

More about the Command Line Interface [here](https://github.com/clibs/clib/wiki/Command-Line-Interface).
