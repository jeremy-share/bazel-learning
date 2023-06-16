load("@rules_python//python:defs.bzl", "py_test")
load("@pypi//:requirements.bzl", "requirement")

def pytest_test(name, srcs, main="//tools/pytest:pytest_wrapper.py", deps = [], args = [], data = [], **kwargs):
    py_test(
        name = name,
        srcs = ["//tools/pytest:pytest_wrapper.py"] + srcs,
        main = main,
        args = [
            "--capture=no",
            "-vvv",
        ] + args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [
            requirement("pytest")
        ],
        **kwargs
    )