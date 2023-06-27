load("@rules_python//python:defs.bzl", "py_test")
load("@pypi//:requirements.bzl", "requirement")

def autopep8(name, srcs, deps = [], args = [], **kwargs):
    default_args = [
        "--diff",
        "--exit-code"
    ]
    tool = "autopep8"
    py_test(
        name = name,
        srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
        main = "wrapper_" + tool + ".py",
        args = default_args+ args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement(tool)],
        **kwargs,
    )

def black(name, srcs, deps = [], args = [], **kwargs):
    default_args = []
    tool = "black"
    py_test(
        name = name,
        srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
        main = "wrapper_" + tool + ".py",
        args = default_args+ args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement(tool)],
        **kwargs,
    )

def flake8(name, srcs, deps = [], args = [], **kwargs):
    default_args = []
    tool = "flake8"
    py_test(
        name = name,
        srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
        main = "wrapper_" + tool + ".py",
        args = default_args+ args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement(tool)],
        **kwargs,
    )

def isort(name, srcs, deps = [], args = [], **kwargs):
    default_args = [
        "--atomic",
        "--check-only",
        "--py 39",
    ]
    tool = "isort"
    py_test(
        name = name,
        srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
        main = "wrapper_" + tool + ".py",
        args = default_args + args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement(tool)],
        **kwargs,
    )

def mypy(name, srcs, deps = [], args = [], **kwargs):
    default_args = []
    tool = "mypy"
    py_test(
        name = name,
        srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
        main = "wrapper_" + tool + ".py",
        args = default_args + args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement(tool)],
        **kwargs
    )

def pylint(name, srcs, deps = [], args = [], **kwargs):
    default_args = []
    tool = "pylint"
    py_test(
        name = name,
        srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
        main = "wrapper_" + tool + ".py",
        args = default_args + args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement(tool)],
        **kwargs
    )
