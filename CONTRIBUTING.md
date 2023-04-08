# Contributing

## Creating a PR

* Please **do not** create Pacscripts on GitHub. We use pre-commit to ensure
  that our repo is of the highest quality, and using GitHub will bypass those
  checks. We **will not** accept any PR suspected of being made entirely using
  tools that do not use git directly.

## PR Etiquette

* Please **do not** click the "Update branch" button every time your branch is
  out of date. This will cause unnecessary spam to our Discord, will waste the
  CIs time, and clutter the squash commit.

* Please test your package locally before creating a PR. Preferably you should
  test on your own computer, along with the [Pacstall docker
  container](https://github.com/pacstall/repo-maintain/pkgs/container/pacstall).
  We are not your package testers, nor should you expect us to be. We may help
  you along the way, but do not ask us to test. That is your job.

* Use the "Add suggestion to batch" button to group related suggestions into a
  single commit, instead of making multiple commits.
