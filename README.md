# # Bazel Learning repo

This repository is what I did to learn Bazel. It's shared in the hope it will be useful to someone, and it might not be 
following best practices, etc., so please check out the links section below.
I have also tried to introduce complexity iteratively through the projects.

## Setup
This repo works best with [Bazelisk](https://github.com/bazelbuild/bazelisk).

## Notes
* One of the most challenging things was the Bazel cache and getting it to persist between pipeline builds. Checkout [.bazelrc](.bazelrc) for details
* The Ubuntu apt version of Bazel is too old!
* Have a look at [.bazeliskrc](.bazeliskrc) for the version of Bazel used
* The [Makefile](Makefile) contains some useful commands for example `make all-run` and `make all-build`
* While the `pytest-{{tool}}` packages looked to be good idea at the time, they did not work well.
  * The Bazel working directory is different to the project directory.
  * Some tools did not let you pass configuration through as arguments.

## Projects:
| Project  | Description                                                                    |
|----------|--------------------------------------------------------------------------------|
| project1 | Simple Python application                                                      |
| project2 | Copy of previous application with Unittests and glob of sources                |
| project3 | Copy of previous application with Pytest (instead of Unittests)                |               
| project4 | Copy of previous application with autopep8, black, flake8, isort, mypy, pylint | 
| project5 | Copy of previous application but simplified                                    |
| project6 | A library with simplified QA                                                   |
| project7 | Copy of project5 but uses the library from project6                            |
| project8 | WIP Copy of project7 but builds a Docker container                             |

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
