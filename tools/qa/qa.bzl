load("@rules_python//python:defs.bzl", "py_binary")
load("@pypi//:requirements.bzl", "requirement")

def black(name, srcs, deps = [], args = []):
    default_args = []
    tool = "black"
    py_binary(
        name = name,
        srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
        main = "wrapper_" + tool + ".py",
        args = default_args+ args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement(tool)],
    )

def flake8(name, srcs, deps = [], args = []):
    default_args = []
    tool = "flake8"
    py_binary(
        name = name,
        srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
        main = "wrapper_" + tool + ".py",
        args = default_args+ args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement(tool)],
    )

def isort(name, srcs, deps = [], args = []):
    default_args = [
        "--atomic",
        "--check-only",
        "--py 39",
    ]
    tool = "isort"
    py_binary(
        name = name,
        srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
        main = "wrapper_" + tool + ".py",
        args = default_args + args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement(tool)],
    )

def mypy(name, srcs, deps = [], args = []):
    default_args = []
    tool = "mypy"
    py_binary(
        name = name,
        srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
        main = "wrapper_" + tool + ".py",
        args = default_args + args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement(tool)],
    )

def pylint(name, srcs, deps = [], args = []):
    default_args = []
    tool = "pylint"
    py_binary(
        name = name,
        srcs = ["//tools/qa:wrapper_" + tool + ".py"] + srcs,
        main = "wrapper_" + tool + ".py",
        args = default_args + args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [requirement(tool)],
    )
