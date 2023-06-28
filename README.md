# # Bazel Learning repo

This repository is what I did to learn Bazel. It's shared in the hope it will be useful to someone, and it might not be 
following best practices, etc., so please check out the links section below.
I have also tried to introduce complexity iteratively through the services.

## Setup
This repo works best with [Bazelisk](https://github.com/bazelbuild/bazelisk).

## Notes
* One of the most challenging things was the Bazel cache and getting it to persist between pipeline builds. Checkout [.bazelrc](.bazelrc) for details
* The Ubuntu apt version of Bazel is too old!
* Have a look at [.bazelversion](.bazelversion) for the version of Bazel used
* The [Makefile](Makefile) contains some useful commands for example `make all-run` and `make all-build`
* While the `pytest-{{tool}}` seem to be a good idea, they do not work well as some can not source the QA config.
  * This is because the Bazel working directory is different to the service directory

## Services:
* Service 1 - Simple Python service
* Service 2 - Copy of service 1 with glob of sources and Unittests
* Service 3 - Copy of service 2 with Pytest (instead of Unittests)
* Service 4 - Copy of service 3 with autopep8, black, flake8, isort, mypy, pylint

## Links / References:
* https://bazel.build/
* https://chat.openai.com
* https://about.gitlab.com/blog/2020/09/01/using-bazel-to-speed-up-gitlab-ci-builds/
* https://stackoverflow.com/questions/58326587/how-do-i-use-pytest-with-bazel
* https://dev.to/davidb31/experimentations-on-bazel-python-3-linter-pytest-49oh
* https://stackoverflow.com/questions/61030216/how-to-disable-pytestdeprecationwarning-direct-construction-of-flake8item-has-b
* https://github.com/bazelbuild/rules_python/issues/55
* https://github.com/jessecureton/python_bazel_template
* https://stackoverflow.com/questions/58253616/how-to-write-a-bazel-test-rule-using-a-provided-tool-rather-than-a-rule-built-on
* https://stackoverflow.com/questions/47303847/best-way-to-configure-pylint-with-bazel

## Old Links / References
* https://stackoverflow.com/questions/61743089/python-testing-with-flake8-and-pytest-results-in-attributeerror-application-o

## TODO
* autopep8
* pytest-cov
