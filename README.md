# Ansible lab

## What

Ansible lab to learn ansible basic workflow and learn environnement. The goal is to become independant in creating, managing and learning ansible as a valuable tools.

## Architecture
This project will be organised by module and assisted with chatgpt as mentor.


here is a description of formation plan in french:

```md
## Plan de formation complet (progressif)

### **Phase 1 — Fondations (indispensable, rapide mais rigoureuse)**

#### Module 1 — YAML & structure Ansible

* Syntaxe YAML (pièges critiques : indentation, types)
* Structure d’un playbook minimal
* Inventaire (INI vs YAML)
* Première exécution (`ansible`, `ansible-playbook`)

👉 Objectif :

* comprendre ce que fait Ansible sans magie

---

#### Module 2 — Modèle d’exécution Ansible

* Agentless (SSH, Python remote)
* Idempotence (concept clé)
* Modules vs commandes shell
* Différence `command`, `shell`, `raw`

👉 DevSecOps focus :

* pourquoi éviter `shell` (risque injection / non idempotent)

---

#### Module 3 — Variables & templating (Jinja2)

* Variables (host/group/all)
* precedence
* facts (`setup`)
* templates `.j2`

👉 Cas concret :

* générer un fichier config dynamique

---

### **Phase 2 — Structuration & industrialisation**

#### Module 4 — Tasks avancées & contrôle de flux

* `when`, `loop`, `register`
* `changed_when`, `failed_when`
* handlers

👉 Objectif :

* maîtriser le comportement exact des tasks

---

#### Module 5 — Rôles (Roles)

* Structure standard
* séparation logique (tasks, handlers, vars, defaults)
* réutilisabilité

👉 Livrable :

* rôle nginx propre + configurable

---

#### Module 6 — Bonnes pratiques projet

* layout repo
* ansible.cfg
* inventories multi-env (dev/staging/prod)
* tags

👉 DevSecOps :

* isolation des environnements

---

### **Phase 3 — Sécurité (DevSecOps core)**

#### Module 7 — Secrets management

* Ansible Vault
* chiffrement fichiers/variables
* rotation

👉 Cas réel :

* credentials DB / API

---

#### Module 8 — Hardening système

* gestion utilisateurs/SSH
* permissions
* firewall (ufw/iptables)
* fail2ban

👉 Référence :

* benchmarks CIS (approche automatisée)

---

#### Module 9 — Contrôle & audit

* check mode (`--check`)
* diff mode
* linting (ansible-lint)

---

### **Phase 4 — Niveau avancé**

#### Module 10 — Collections & Galaxy

* Ansible Galaxy
* dépendances
* structuration entreprise

---

#### Module 11 — Debug avancé

* verbosity (`-vvv`)
* debug module
* analyse erreurs modules

---

#### Module 12 — Performance & scaling

* forks
* stratégies (linear/free)
* optimisation SSH

---

### **Phase 5 — Sous le capot (objectif différenciant)**

#### Module 13 — Architecture interne Ansible

* fonctionnement d’un module
* transport JSON
* exécution distante

---

#### Module 14 — Développement de modules custom (Python)

👉 Tu vas coder :

1. Module minimal :

   * input args
   * retour JSON
   * idempotence simple

2. Module avancé :

   * gestion état (present/absent)
   * validation arguments
   * gestion erreurs

👉 Bénéfice :

* compréhension profonde → debug + crédibilité pro

---

### **Phase 6 — Projet final (portfolio DevSecOps)**

Déploiement complet :

* VM (local ou cloud)
* stack applicative (nginx + app)
* secrets chiffrés
* hardening SSH + firewall
* sauvegardes automatisées

👉 Livrable :

* repo Git propre, prêt à montrer en entretien

---

## Méthodologie appliquée

Chaque module =

1. Concept minimal
2. Cas concret reproductible (Debian)
3. Mini projet
4. Questions + exercices obligatoires
5. Correction + itération
```
