# Pacstall Programs

This is the default repository of pacscripts which [pacstall](https://github.com/pacstall/pacstall) uses to install software. You can fork this repository and add make your own package repository as long as it follows the basic structure:

```monospace
package-repository/
├── packages/
│   ├── example-package1/
│   │   ├── example-package1.pacscript
│   │   └── .SRCINFO
│   └── example-package2/
│       ├── example-package2.pacscript
│       └── .SRCINFO
├── scripts/
│   ├── srcinfo.sh
│   ├── custom-script1.sh
│   └── custom-script2.sh
├── distrolist
├── packagelist
└── srclist
```

You can then use the `pacstall -A` command to add a repository to your `pacstallrepo` list.
Consult the manpage (run `man 8 pacstall` and `man 5 pacstall`) for more info.

## How to setup the environment for pacscript development

If you need help making a pacscript, visit [our wiki](https://github.com/pacstall/pacstall/wiki/Pacscript-101).

This repository maintains a certain standard of commits. To ensure that your commits are up to the standard, we use [pre-commit](https://pre-commit.com/) hooks.

Here are the development dependencies that you need to install as a developer:

| Dependency | Purpose | How to install |
|:-----------|:-------:|----------------|
| [pre-commit](https://pre-commit.com/) | runs a series of formatting checks on git commits | `sudo pip install pre-commit` |
| [shellcheck](https://www.shellcheck.net/) | checks for formatting and scripting issues | `pacstall -I shellcheck-bin` |
| [shfmt](https://pkg.go.dev/mvdan.cc/sh/v3) | attempts to correct certain formatting issues | `pacstall -I shfmt-bin` |
| [editor-config](https://editorconfig.org/#download) | ensures proper tabs when using a file editor | Install the plugin for your preferred editor |

After the dependencies are installed simply clone this repository, and use `pre-commit install` to install the pre-configured hooks to your cloned repository.

Now, whenever you try to commit a patch all the configured hooks will run and block/fix your code so that it adheres to or standards.

In case for some reason (false positives etc), you want to skip the hooks commit using `git commit --no-verify`

Additionally, we have created the following tools to improve package maintenance:

| Maintainence Tool | Purpose | How to install |
|:-----------------|:-------:|----------------|
| [pacup](https://github.com/pacstall/pacup) | keep packages up to date | `pacstall -I pacup` (stable) or `pacstall -I pacup-git` (develop) |
| [quality-assurance.sh](https://github.com/pacstall/pacstall/blob/master/misc/scripts/quality-assurance.sh) | test PRs before being merged | `pacstall -Qa` (built-in, pacstall) |
| [srcinfo.sh](https://github.com/pacstall/pacstall-programs/blob/master/scripts/srcinfo.sh) | generate and read repo data | `./scripts/srcinfo.sh` (built-in, pacstall-programs) |

## License

Pacstall programs are licensed under the MIT License.

> [!NOTE]
> MIT license does not apply to the packages built by Pacstall, merely to the
> files in this repository (the pacscripts, GitHub Action workflows,
> documentation, etc.). It also might not apply to patches included in pacscripts,
> which may be derivative works of the packages to which they apply. The
> aforementioned artifacts are all covered by the licenses of the respective
> packages.

## Stats

<p align="center"><img alt="Repobeats analytics image" src="https://repobeats.axiom.co/api/embed/6339f9352d6dc27063ee90400da619442ee5143b.svg" /></p>
