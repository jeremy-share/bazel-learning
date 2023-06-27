all-run:
	bazel run //projects/project1:main
	bazel run //projects/project2:main
	bazel run //projects/project3:main
	bazel run //projects/project4:main
	bazel run //projects/project5:main
	bazel run //projects/project6:main
	bazel run //projects/project7:main

all-test:
	bazel test //...

all-test-manual:
# Example
	# bazel test //projects/project2:lint
	# bazel test //projects/project3:lint
	# bazel test //projects/project4:lint
	#bazel test //projects/project5:lint
	#bazel run //projects/project5:unit-test
	#bazel run //projects/project6:test
	#bazel test //projects/project7:test

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
	bazel run //projects/project1:main

project5-unit-tests:
	bazel run //projects/project5:unit-tests

project6-unit-tests:
	bazel run //projects/project6:unit-tests

all-build:
	bazel build //...

all-build-explained:
#--incompatible_strict_action_env
	bazel build //... --explain=explain.log --verbose_explanations --watchfs
	cat explain.log

requirements_lock:
	bazel run //:requirements.update
