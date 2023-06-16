load("@rules_python//python:defs.bzl", "py_test")
load("@pypi//:requirements.bzl", "requirement")

def pytest_test(name, srcs, deps = [], args = [], data = [], **kwargs):
    py_test(
        name = name,
        srcs = [
            "//tools/pytest_full:pytest_wrapper.py",
            "//tools/pytest_full:__init__.py"
        ] + srcs,
        main = "//tools/pytest_full:pytest_wrapper.py",
        args = [
            "--capture=no",
            "--black",
            # "--pylint",
            # "--mypy",
            "--pylint-rcfile=$(location //tools/pytest_full:.pylintrc)",
            "-vvvv",
        ] + args + ["$(location :%s)" % x for x in srcs],
        data = [
            "//tools/pytest_full:.pylintrc"
        ] + data,
        deps = deps + [
            requirement("pytest"),
            requirement("pytest-black"),
            requirement("pytest-pylint"),
            requirement("pytest-mypy"),
        ],
        **kwargs
    )
