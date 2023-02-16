**1) Quels sont les avantages d'utiliser Terraform ?**

Terraform est un outil de configuration as code permettant de déployer des infrastructures sur différents providers (AWS, GCP, Azure, etc...).
Il permet de définir une configuration sous forme de code et de déployer cette configuration sur un environnement.
Terraform permet de déployer rapidement une infrastructure, de la re-déployer à partir de la même configuration.
Il permet également de déployer des ressources sur différents environnements en modifiant simplement les variables de configuration.

**2) Comment fonctionne le Tfstate ?**

Le tfstate est un fichier contenant l'état de l'infrastructure déployée par Terraform.
Il permet de garder une trace de l'état de l'infrastructure déployée, de pouvoir la modifier, de la détruire et de la re-déployer.

**3) Qu'est-ce qu'Azure ? Que peut-on déployer sur Azure ?**

Azure est un cloud public proposant de nombreux services. On peut déployer des machines virtuelles, des bases de données, des applications web, des conteneurs, des services de stockage, etc...

**4) Citez 2 outils DevOps (en dehors de Terraform) et donnez une description très basique de ces outils et leur utilité.**

- Ansible est un outil de configuration as code permettant de déployer des infrastructures sur différents environnements (serveurs, containers, VM, etc...).
- Jenkins est un outil d'intégration continue permettant de déployer des applications sur différents environnements.

**5) Quelles sont les deux façons de déployer un Pod sur Kubernetes ?**
- Créer un fichier YAML contenant la configuration du Pod
  1. avec la commande: kubectl apply -f <fichier.yaml>
  2. avec la commande: kubectl create -f <fichier.yaml>
