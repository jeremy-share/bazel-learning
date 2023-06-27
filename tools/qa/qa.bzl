load("@rules_python//python:defs.bzl", "py_test")
load("@pypi//:requirements.bzl", "requirement")


def autopep8(name, srcs, deps = [], args = [], **kwargs):
    args = [
        "--diff",
        "--exit-code"
    ] + args
    qa_wrapper(name, "autopep8", srcs, deps, args, **kwargs)

def black(name, srcs, deps = [], args = [], **kwargs):
    qa_wrapper(name, "black", srcs, deps, args, **kwargs)

def flake8(name, srcs, deps = [], args = [], **kwargs):
    qa_wrapper(name, "flake8", srcs, deps, args, **kwargs)

def isort(name, srcs, deps = [], args = [], **kwargs):
    args = [
        "--atomic",
        "--check-only",
        "--py 39",
    ] + args
    qa_wrapper(name, "isort", srcs, deps, args, **kwargs)

def mypy(name, srcs, deps = [], args = [], **kwargs):
    qa_wrapper(name, "mypy", srcs, deps, args, **kwargs)

def pylint(name, srcs, deps = [], args = [], **kwargs):
    qa_wrapper(name, "pylint", srcs, deps, args, **kwargs)

def pytest_test(name, srcs, deps = [], args = [], **kwargs):
    args = [
        "--capture=no",
        "-vvv",
    ] + args
    qa_wrapper(name, "pytest", srcs, deps, args, **kwargs)

def qa_wrapper(name, tool, srcs, deps = [], args = [], **kwargs):
    py_test(
            name = name,
            srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
            main = "wrapper_" + tool + ".py",
            args = args + ["$(location :%s)" % x for x in srcs],
            deps = deps + [requirement(tool)],
        **kwargs,
    )