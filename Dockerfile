# creator-ee v0.3.1 -> ansible-lint v6.0.1
FROM quay.io/ansible/creator-ee:v0.3.1

LABEL "maintainer"="Ansible by Red Hat <info@ansible.com>"
LABEL "repository"="https://github.com/ansible/ansible-lint-action"
LABEL "homepage"="https://github.com/ansible/ansible-lint-action"

LABEL "com.github.actions.name"="ansible-lint"
LABEL "com.github.actions.description"="Run Ansible Lint"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="gray-dark"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
