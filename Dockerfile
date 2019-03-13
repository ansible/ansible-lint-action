FROM python:3.7-slim

LABEL "maintainer"="Ansible by Red Hat <info@ansible.com>"
LABEL "repository"="https://github.com/ansible/ansible-lint-action"
LABEL "homepage"="https://github.com/ansible/ansible-lint-action"
LABEL "version"="4.1.0"

LABEL "com.github.actions.name"="ansible-lint"
LABEL "com.github.actions.description"="Run Ansible Lint"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="gray-dark"

RUN pip install ansible-lint==4.1.0

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
