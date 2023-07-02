all-run:
	bazel run //projects/project1_service:main
	bazel run //projects/project2_service:main
	bazel run //projects/project3_service:main
	bazel run //projects/project4_service:main
	bazel run //projects/project5_service:main

all-test:
	bazel test //...

all-build:
	bazel build //...

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
	USER_ID=`id -u` GROUP_ID=`id -g` docker-compose run --rm bazel bash

shell:
	make docker-compose-shell

requirements_lock:
	bazel run //:requirements.update
