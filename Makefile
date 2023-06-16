PROJECT_DIRS := $(shell  find . -type d -name "project*" | sed 's|./||g')

.PHONY: all-run $(PROJECT_DIRS)

# Runs all projects
all-run: $(PROJECT_DIRS)

$(PROJECT_DIRS):
	-bazel run //$(notdir $@):$(notdir $@)

#bazel-debug:
#	which pylint
##	cat .bazelrc
#	ls -la .bazel-cache/ | true
#	whoami | true
#	ls -la . | true
#	find . | grep -v ".git" | true
#	ls -la /root/.cache | true

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
	USER_ID=`id -u` GROUP_ID=`id -g` docker-compose run --rm bazel bash

shell:
	make docker-compose-shell

project1-run:
	bazel run //project1:project1

project5-unit-tests:
	bazel run //project5:unit-tests

project6-unit-tests:
	bazel run //project6:unit-tests

all-build:
	bazel build //...

all-build-explained:
#--incompatible_strict_action_env
	bazel build //... --explain=explain.log --verbose_explanations --watchfs
	cat explain.log

requirements_lock:
	bazel run //:requirements.update
