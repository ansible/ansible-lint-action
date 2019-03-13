# Ansible Lint for GitHub Action
This action allows you to run `ansible-lint` with no additional options.


## Usage
To use the action simply add the following lines to your `.github/main.workflow`.

```hcl
action "Lint Ansible Playbook" {
  uses = "ansible/ansible-lint-action@v4.1.0"
}
```

N.B. Use `v4.1.0` or any other valid tag, or branch, or commit SHA instead
of `master` to pin the action to use a specific version.


### Environment Variables
- **ACTION_PLAYBOOK_NAME**: (optional) defaults to `playbook.yml`


## License
The Dockerfile and associated scripts and documentation in this project are released under the [MIT](license).


## Credits
The initial GitHub action has been created by [Stefan Stölzle](/stoe) at
[stoe/actions](https://github.com/stoe/actions).
