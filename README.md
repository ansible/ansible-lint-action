# Notice

This is unmaintained. Please use the current Github action here: https://github.com/marketplace/actions/run-ansible-lint


# Ansible Lint for GitHub Action

This action allows you to run `ansible-lint` on your codebase without having
to install it yourself.

## Usage

To use the action simply create an `ansible-lint.yml` (or choose custom `*.yml` name) in the `.github/workflows/` directory.

For example:

```yaml
name: ansible-lint
on: [push, pull_request]

jobs:
  build:
    name: Ansible Lint # Naming the build is important to use it as a status check
    runs-on: ubuntu-latest

    steps:
      # Important: This sets up your GITHUB_WORKSPACE environment variable
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0 # needed for progressive mode to work

      - name: Run ansible-lint
        # replace `main` with any valid ref, or tags like `v6`
        uses: ansible/ansible-lint-action@main
        # optional:
        # with:
        #   path: "playbooks/"  # <-- only one value is allowed
```

Due to limitations on how GitHub Actions are processing arguments, we do not
plan to provide extra options. You will have to make use of [ansible-lint own configuration file](https://ansible-lint.readthedocs.io/configuring/)
for altering its behavior.

If you still want custom arguments, you can still fork the action and modify
its `action.yml` file.

> TIP: N.B. Use `ansible/ansible-lint-action@v6` or any other valid tag, or branch, or commit SHA to pin the action to use a specific version.

Alternatively, you can run the ansible lint only on certain branches:

```yaml
on:
  push:
    branches:
      - stable
      - release/v*
```

or on various [events](https://help.github.com/en/articles/events-that-trigger-workflows)

<br>

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT](license).

## Credits

The initial GitHub action has been created by [Stefan Stölzle](https://github.com/stoe) at
[stoe/actions](https://github.com/stoe/actions).
