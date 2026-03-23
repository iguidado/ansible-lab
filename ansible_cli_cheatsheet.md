# Ansible CLI cheatsheet

## Targeting — who you're talking to

| Pattern | Description |
|---|---|
| `ansible all` | all hosts |
| `ansible web` | group `web` only |
| `ansible web01` | specific host |
| `ansible 'web,db'` | multiple groups |
| `ansible 'web:!web01'` | web except web01 |
| `ansible 'web:&db'` | intersection of web and db |

---

## Ad-hoc commands — no playbook needed

```bash
# Connectivity test
ansible all -m ping

# Simple command (no pipe support)
ansible web -m command -a "uptime"

# Shell command (pipes, redirections, env vars)
ansible web -m shell -a "ps aux | grep nginx"

# All facts for a host
ansible all -m setup

# Filtered facts
ansible all -m setup -a "filter=ansible_os*"

# Install a package (become = sudo)
ansible web -m apt -a "name=nginx state=present" -b
```

---

## Playbooks

```bash
# Run a playbook
ansible-playbook site.yml

# Dry-run — nothing is changed
ansible-playbook site.yml --check

# Show file diffs
ansible-playbook site.yml --diff

# Only tasks tagged 'nginx'
ansible-playbook site.yml -t nginx

# Confirm task by task
ansible-playbook site.yml --step

# Restrict to one host
ansible-playbook site.yml -l web01

# Pass an extra variable
ansible-playbook site.yml -e "env=prod"

# Validate YAML without running
ansible-playbook site.yml --syntax-check
```

---

## Inventory & config

```bash
# JSON dump of the inventory
ansible-inventory --list

# Group tree
ansible-inventory --graph

# Active config (non-default values only)
ansible-config dump --only-changed

# Version + loaded config file
ansible --version
```

---

## Universal flags

| Flag | Description |
|---|---|
| `-v` / `-vv` / `-vvv` | verbosity (1 → 3) |
| `-b` / `--become` | sudo escalation |
| `-u USER` | override remote_user |
| `-i inventory` | override inventory file |
| `-f 10` | forks (parallelism) |
| `--check` | dry-run |
| `--diff` | show file diffs |

---

## `command` vs `shell`

| Module | Pipes/redirections | Env vars | Use when |
|---|---|---|---|
| `command` | no | no | default — safer, no shell injection |
| `shell` | yes | yes | you actually need pipes or `&&` |

> Always default to `command`. Use `shell` only when necessary.

---

## Key concepts

**`changed: false`** — the system was already in the desired state, nothing was modified. This is idempotence working correctly.

**`changed: true`** — Ansible had to modify something to reach the desired state.

**`become`** — privilege escalation (equivalent to `sudo`). Required for `apt`, `service`, writing to system paths.

**`gather_facts`** — Ansible's first task on every play: connects to the host, runs a Python script, and collects ~200 variables (`ansible_os_family`, `ansible_default_ipv4`, etc.). Disable with `gather_facts: false` when you don't need them (speeds things up).
