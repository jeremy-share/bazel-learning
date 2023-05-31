load("@rules_python//python:defs.bzl", "py_test")
load("@pypi//:requirements.bzl", "requirement")

def remove_duplicates_preserve_order(elements):
    seen = {}
    result = []
    for element in elements:
        if element not in seen:
            result.append(element)
            seen[element] = True
    return result

def pytest_test(name, srcs, main="tests/__main__.py", deps = [], args = [], **kwargs):
    py_test(
        name = name,
        srcs = [
            "//bazel_rules:pytest_wrapper.py",
        ] + srcs,
        main = "//bazel_rules:pytest_wrapper.py",
        args = [
            "--black",
            #"--mypy",
            # "--pylint",
            #"--capture=no",
            "-v",
        ] + args + ["$(location :%s)" % x for x in srcs],
        python_version = "PY3",
        srcs_version = "PY3",
        deps = deps + [
            requirement("pytest"),
            requirement("pytest-black"),
            requirement("pytest-pylint"),
            requirement("pytest-mypy"),
        ],
        **kwargs
    )