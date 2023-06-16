def _pylint_impl(ctx):
    input_files = ctx.files.srcs
    output_file = ctx.actions.declare_file(ctx.attr.name)

    pylint_home = "$(mktemp -d)"
    command = "PYLINTHOME={} pylint {} | tee {} ; test ${{PIPESTATUS[0]}} -eq 0".format(
        pylint_home,
        ' '.join([f.path for f in input_files]),
        output_file.path
    )

    ctx.actions.run_shell(
        inputs=input_files,
        outputs=[output_file],
        command=command
    )

    return DefaultInfo(files=depset([output_file]))

pylint = rule(
    implementation=_pylint_impl,
    attrs={
        "srcs": attr.label_list(allow_files=True),
    },
)