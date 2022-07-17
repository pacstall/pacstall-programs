# Pacstall Programs

This is the default repository of pacscripts which [pacstall](https://github.com/pacstall/pacstall) uses to install software. You can fork this repository and add make your own package repository as long as it follows the basic structure:

```monospace
package-repository/
├── packagelist
└── packages/
    └── example-package1/
    |   └── example-package1.pacscript
    └── example-package2/
        └── example-package2.pacscript
```

You can then use `pacstall -A` command to add your repository to your `repolist`. Consult the wiki for more info.

## How to setup the environment for pacscript development

If you need help making a pacscript, visit [our wiki](https://github.com/pacstall/pacstall/wiki/Pacscript-101).

This repository maintains a certain standard of commits. To ensure that your commits are up to the standard, we use [pre-commit](https://pre-commit.com/) hooks.

Here are the development dependencies that you need to install as a developer:

| Dependency                                          | How to install                      |
:----------------------------------------------------:|-------------------------------------|
| [pre-commit](https://pre-commit.com/)               | `sudo pip install pre-commit`       |
| [shellcheck](https://www.shellcheck.net/)           | `pacstall -PI shellcheck-bin`       |
| [shfmt](https://pkg.go.dev/mvdan.cc/sh/v3)          | `pacstall -PI shfmt-bin`            |
| [editor-config](https://editorconfig.org/#download) | Install the plugin for your editor  |

After the dependencies are installed simply clone this repository, and use `pre-commit install` to install the pre-configured hooks to your cloned repository.

Now, whenever you try to commit a patch all the configured hooks will run and block/fix your code so that it adheres to or standards.

In case for some reason (false positives etc), you want to skip the hooks commit using `git commit --no-verify`

## Stats

<p align="center"><img alt="Repobeats analytics image" src="https://repobeats.axiom.co/api/embed/6339f9352d6dc27063ee90400da619442ee5143b.svg" /></p>
