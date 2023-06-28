load("@rules_python//python:defs.bzl", "py_test")
load("@pypi//:requirements.bzl", "requirement")

MAX_LINE_LENGTH="120"

def merge_dicts(dict1, dict2):
    result = {}
    result.update(dict1)
    result.update(dict2)
    return result

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

def pytest_test(name, srcs, cov = None, cov_min = None, cov_report = "term-missing", args = [], deps = [], **kwargs):
    base_args = [
        "--capture=no",
        "-vvv",
        "--cov-report=%s" % cov_report
    ]
    deps = [requirement("pytest-cov")] + deps

    if type(cov) == "bool" and cov == True:
        base_args = base_args + ["--cov"]
    elif type(cov) == "list" and len(cov) > 0:
        base_args += ["--cov=%s" % x for x in cov]

    if cov_min != None:
        base_args += ["--cov-fail-under=%s" % cov_min]

    qa_wrapper(tool="pytest", name=name, srcs=srcs, args=base_args + args, deps=deps, **kwargs)

def standard_qa(
    srcs,
    cov = None,
    cov_min = None,
    autopep8_kwargs = {},
    black_kwargs = {},
    flake8_kwargs = {},
    isort_kwargs = {},
    mypy_kwargs = {},
    pylint_kwargs = {},
    pytest_kwargs = {},
    **kwargs
):
    autopep8(name="autopep8", srcs=srcs, **merge_dicts(autopep8_kwargs, kwargs))
    black(name="black", srcs=srcs, **merge_dicts(black_kwargs, kwargs))
    flake8(name="flake8", srcs=srcs, **merge_dicts(flake8_kwargs, kwargs))
    isort(name="isort", srcs=srcs, **merge_dicts(isort_kwargs, kwargs))
    mypy(name="mypy", srcs=srcs, **merge_dicts(mypy_kwargs, kwargs))
    pylint(name="pylint", srcs=srcs, **merge_dicts(pylint_kwargs, kwargs))
    pytest_test(name="unit", srcs=srcs, cov=cov, cov_min=cov_min, **merge_dicts(pytest_kwargs, kwargs))
