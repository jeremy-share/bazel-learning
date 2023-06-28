load("@rules_python//python:defs.bzl", "py_test")
load("@pypi//:requirements.bzl", "requirement")

def qa_wrapper(name, tool, srcs, deps = [], args = [], **kwargs):
    py_test(
        name = name,
        srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
        main = "wrapper_" + tool + ".py",
        args = args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement(tool)],
        **kwargs,
    )

def autopep8(name, srcs, args = [], **kwargs):
    args = [
        "--diff",
        "--exit-code"
    ] + args
    qa_wrapper(name=name, tool="autopep8", srcs=srcs, args=args, **kwargs)

def black(name, srcs, **kwargs):
    qa_wrapper(name=name, tool="black", srcs=srcs, **kwargs)

def flake8(name, srcs, **kwargs):
    qa_wrapper(name=name, tool="flake8", srcs=srcs, **kwargs)

def isort(name, srcs, args = [], **kwargs):
    args = [
        "--atomic",
        "--check-only",
        "--py 39",
    ] + args
    qa_wrapper(name=name, tool="isort", srcs=srcs, args=args, **kwargs)

def mypy(name, srcs, args = [], **kwargs):
    args = [
        "--strict",
        "--pretty",
        "--explicit-package-bases",  # I am not sure about this TODO: look into docs more
    ] + args
    qa_wrapper(name=name, tool="mypy", srcs=srcs, args=args, **kwargs)

def pylint(name, srcs, **kwargs):
    qa_wrapper(name=name, tool="pylint", srcs=srcs, **kwargs)

def pytest_test(name, srcs, args = [], **kwargs):
    args = [
        "--capture=no",
        "-vvv",
    ] + args
    qa_wrapper(name=name, tool="pytest", srcs=srcs, args=args, **kwargs)
