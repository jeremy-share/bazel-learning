workspace(
    name = "bazel_learning",
)

# === PROJECT 2 ONWARDS =====================================================

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_python",
    sha256 = "863ba0fa944319f7e3d695711427d9ad80ba92c6edd0b7c7443b84e904689539",
    strip_prefix = "rules_python-0.22.0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.22.0/rules_python-0.22.0.tar.gz",
)

load("@rules_python//python:repositories.bzl", "py_repositories")

py_repositories()

load("@rules_python//python:pip.bzl", "pip_parse")

pip_parse(
   name = "pypi",
   requirements_lock = "//tools/pip:requirements.txt",
)

load("@pypi//:requirements.bzl", "install_deps")
install_deps()

# === PROJECT 8 ONWARDS =====================================================

# https://github.com/bazelbuild/rules_docker

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz"],
)

load("@io_bazel_rules_docker//toolchains/docker:toolchain.bzl",
    docker_toolchain_configure="toolchain_configure"
)
docker_toolchain_configure(
  name = "docker_config",
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
    name = "python_base",
    registry = "index.docker.io",
    repository = "python",
    tag = "3.9.17-slim-bookworm",
    digest = "sha256:458de07c635e7b842b821d3d3668f3b2ab71090707d555eb53410b45ff618639"
)

