load("@rules_python//python:defs.bzl", "py_test")
load("@pypi//:requirements.bzl", "requirement")


def pytest_test(name, srcs, cov = None, cov_min = None, cov_report = "term-missing", args = [], deps = [], **kwargs):
    base_args = [
        "--capture=no",
        "-vvv",
        "--cov-report=%s" % cov_report
    ]

    if type(cov) == "bool" and cov == True:
        base_args = base_args + ["--cov"]
    elif type(cov) == "list" and len(cov) > 0:
        base_args += ["--cov=%s" % x for x in cov]

    if cov_min != None:
        base_args += ["--cov-fail-under=%s" % cov_min]

    py_test(
        name = name,
        srcs = ["//tools/pytest:wrapper_pytest.py"] + srcs,
        main = "wrapper_pytest.py",
        args = args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement("pytest"), requirement("pytest-cov")],
        **kwargs,
    )
