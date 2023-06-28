load("@rules_python//python:defs.bzl", "py_test")
load("@pypi//:requirements.bzl", "requirement")

MAX_LINE_LENGTH="120"

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
        "--exit-code",
        "--max-line-length=" + MAX_LINE_LENGTH,
    ] + args
    qa_wrapper(tool="autopep8", name=name, srcs=srcs, args=args, **kwargs)

def black(name, srcs, args = [], **kwargs):
    args = [
        "--line-length=" + MAX_LINE_LENGTH,
        "--check",
    ] + args
    qa_wrapper(tool="black", name=name, srcs=srcs, args=args, **kwargs)

def flake8(name, srcs, args = [], **kwargs):
    args = [
        "--max-line-length=" + MAX_LINE_LENGTH,
    ] + args
    qa_wrapper(tool="flake8", name=name, args=args, srcs=srcs, **kwargs)

def isort(name, srcs, args = [], **kwargs):
    args = [
        "--line-length=" + MAX_LINE_LENGTH,
        "--atomic",
        "--check-only",
        "--diff",
        "--profile=black",
        "--combine-as",
        "--lines-after-imports=2",
        "--multi-line=3",
    ] + args
    qa_wrapper(tool="isort", name=name, srcs=srcs, args=args, **kwargs)

def mypy(name, srcs, args = [], **kwargs):
    args = [
        "--strict",
        "--pretty",
        "--explicit-package-bases",  # I am not sure about this TODO: look into docs more
    ] + args
    qa_wrapper(tool="mypy", name=name, srcs=srcs, args=args, **kwargs)

def pylint(name, srcs, **kwargs):
    qa_wrapper(tool="pylint", name=name, srcs=srcs, **kwargs)

def pytest_test(name, srcs, args = [], **kwargs):
    args = [
        "--capture=no",
        "-vvv",
    ] + args
    qa_wrapper(tool="pytest", name=name, srcs=srcs, args=args, **kwargs)

def standard_qa(
    srcs,
    autopep8_kwargs = {},
    black_kwargs = {},
    flake8_kwargs = {},
    isort_kwargs = {},
    mypy_kwargs = {},
    pylint_kwargs = {},
    pytest_kwargs = {}
):
    autopep8(name="autopep8", srcs=srcs, **autopep8_kwargs)
    black(name="black", srcs=srcs, **black_kwargs)
    flake8(name="flake8", srcs=srcs, **flake8_kwargs)
    isort(name="isort", srcs=srcs, **isort_kwargs)
    mypy(name="mypy", srcs=srcs, **mypy_kwargs)
    pylint(name="pylint", srcs=srcs, **pylint_kwargs)
    pytest_test(name="pytest", srcs=srcs, **pytest_kwargs)
