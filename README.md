# Ansible Lint for GitHub Action

This action allows you to run `ansible-lint` with no additional options.

## Usage

To use the action simply create an `ansible-lint.yml` (or choose custom `*.yml` name) in the `.github/workflows/` directory.

For example:

```yaml
name: Ansible Lint # feel free to pick your own name

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      # Important: This sets up your GITHUB_WORKSPACE environment variable
      - uses: actions/checkout@v2

      - name: Lint Ansible Playbook
        # replace `main` with any valid ref, or tags like `v6`
        uses: ansible/ansible-lint-action@main
        # optional:
        with:
          args: "" # args to pass to ansible-lint command
```

> TIP: N.B. Use `ansible/ansible-lint-action@v4.1.0` or any other valid tag, or branch, or commit SHA instead of `v4.1.0` to pin the action to use a specific version.

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
