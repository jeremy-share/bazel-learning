which-bazel-python:
	bazel run //:print_python_bin

venv:
	python3.10 -m venv .venv
	@echo "please run 'source ./.venv/bin/activate'"

venv-deactivate:
	@echo "please run 'deactivate'"

all-run:
	bazel run //projects/project1:main
	bazel run //projects/project2:main
	bazel run //projects/project3:main
	bazel run //projects/project4:main
	bazel run //projects/project5:main
	bazel run //projects/project7:main
	bazel run //projects/project8:main

all-test:
	bazel test //...

all-build:
	bazel build //...

all-validate:
	make all-build
	make all-test
	make all-run

all-build-explained:
#--incompatible_strict_action_env
	bazel build //... --explain=explain.log --verbose_explanations --watchfs
	cat explain.log

ci:
	make all-test
	make all-build

cleanup:
	rm -rf output/ | true
	rm -rf bazel-bazel_learning/ | true
	rm -rf bazel-* | true
	rm -rf .bazel_cache | true
	rm -rf .bazel_cache_user | true
	mkdir -p .bazel_cache
	mkdir -p .bazel_cache_user
	bazel clean --expunge

docker-compose-shell:
	USER_ID=`id -u` GROUP_ID=`id -g` docker compose run --rm bazel bash

shell:
	make docker-compose-shell

requirements_lock:
	bazel run //:requirements.update
