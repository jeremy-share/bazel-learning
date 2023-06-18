# # Bazel Learning repo

This repository is what I did to learn Bazel. It's shared in the hope it will be useful to someone, and it might not be 
following best practices, etc., so please check out the links section below.
I have also tried to introduce complexity iteratively through the projects.

## Setup
This project works best with [Bazelisk](https://github.com/bazelbuild/bazelisk).

## Notes
* One of the most challenging things was the Bazel cache and getting it to persist between pipeline builds. Checkout [.bazelrc](.bazelrc) for details
* The Ubuntu apt version of Bazel is too old!
* Have a look at [.bazelversion](.bazelversion) for the version of Bazel used
* The [Makefile](Makefile) contains some useful commands for example `make all-run` and `make all-build`

## Projects:
* Project 1 - Simple Python project
* Project 2 - Custom command (Pylint)
* Project 3 - Using Globs (automation)
* Project 4 - Renaming main entrypoint
* Project 5 - Unittests
* Project 6 - Pytest
* Project 7 - Pytest and QA tools

## Links / References:
* https://bazel.build/
* https://chat.openai.com
* https://about.gitlab.com/blog/2020/09/01/using-bazel-to-speed-up-gitlab-ci-builds/
* https://stackoverflow.com/questions/58326587/how-do-i-use-pytest-with-bazel
* https://dev.to/davidb31/experimentations-on-bazel-python-3-linter-pytest-49oh
* https://stackoverflow.com/questions/61030216/how-to-disable-pytestdeprecationwarning-direct-construction-of-flake8item-has-b
* https://github.com/bazelbuild/rules_python/issues/55


## TODO
* autopep8
* pytest-cov
