load("@rules_python//python:defs.bzl", "py_test")
load("@pypi//:requirements.bzl", "requirement")

def pytest_test(name, srcs, cov, deps = [], data = [], args = [], **kwargs):
    py_test(
        name = name,
        srcs = ["//tools/pytest_qa:pytest_wrapper.py"] + srcs,
        main = "//tools/pytest_qa:pytest_wrapper.py",
        args = [
            "--capture=no",
            "--black",
            "--pylint",
            "--mypy",
            "--flake8",
            "--isort",
            "--cov",
            "--cov-config=$(location //tools/pytest_qa:.coveragerc)",
            "-W ignore::DeprecationWarning",
            "-W ignore::pytest.PytestWarning",
            "-vvvv",
        ] + args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [
            requirement("pytest"),
            requirement("pytest-cov"),
            requirement("pytest-black"),
            requirement("pytest-pylint"),
            requirement("pytest-mypy"),
            requirement("pytest-flake8"),
            requirement("pytest-isort"),
        ],
        data = [
            "//tools/pytest_qa:.coveragerc"
        ] + data,
        **kwargs
    )
