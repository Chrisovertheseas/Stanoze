# Explication du projet Memoire de Stanoze

Ce document resume tout ce qui a ete fait pour le site et explique, pas a pas, comment le relancer en local puis le publier sur GitHub Pages.

## 1. A quoi sert ce projet

Le projet est un site web statique. Cela veut dire:

- il est compose de fichiers simples comme `index.html`, `styles.css` et `script.js`
- il n'a pas besoin de base de donnees
- il peut etre heberge gratuitement sur GitHub Pages

Le site presente:

- un lien vers un PDF
- un lien vers une cagnotte
- une video YouTube integree

## 2. Les fichiers principaux

- `index.html` : la structure de la page
- `styles.css` : l'apparence du site
- `script.js` : le comportement JavaScript
- `404.html` : la page affichee si une adresse est invalide sur GitHub Pages
- `lancer-site.bat` : lancement local sous Windows
- `lancer-site.sh` : lancement local sous macOS ou Linux
- `README.md` : presentation generale du projet
- `INSTALL.md` : aide pour l'installation sur Windows

## 3. Comment lancer le site en local

Lancer le site en local permet de le voir sur ton ordinateur avant de le publier.

### Sous Windows

1. Ouvre le dossier `Stanoze`.
2. Double-clique sur `lancer-site.bat`.
3. Une fenetre noire s'ouvre.
4. Le navigateur ouvre automatiquement le site.

L'adresse locale est:

```text
http://127.0.0.1:4173/
```

### Sous macOS ou Linux

1. Ouvre un terminal dans le dossier du projet.
2. Lance la commande:

```bash
./lancer-site.sh
```

Si le fichier n'est pas executable, tu peux d'abord le rendre executable avec:

```bash
chmod +x lancer-site.sh
```

### Comment arreter le site local

Dans le terminal, appuie sur:

```text
Ctrl+C
```

## 4. Ce que font les scripts de lancement

Les deux scripts lancent un serveur web local avec Python.

La logique est la suivante:

1. ils verifient si Python est installe
2. ils demarrent un serveur local
3. ils ouvrent le navigateur sur `http://127.0.0.1:4173/`

La commande importante est:

```bash
python -m http.server 4173 --bind 127.0.0.1
```

### Explication de cette commande

- `python` : lance Python
- `-m http.server` : demarre un serveur web simple
- `4173` : port utilise par le site
- `--bind 127.0.0.1` : limite l'acces a ton ordinateur seulement

Pourquoi utiliser un serveur local?

- cela evite certains problemes quand on ouvre simplement `index.html`
- cela reproduit mieux le fonctionnement d'un vrai site web
- cela permet de tester les liens, le JavaScript et la navigation

## 5. Explication des commandes Git

Git sert a enregistrer l'historique du projet.

### `git status`

Cette commande montre l'etat du dossier:

- quels fichiers ont ete modifies
- quels fichiers sont nouveaux
- quels fichiers sont deja prepares pour un commit

Exemple:

```bash
git status
```

### `git add .`

Cette commande prepare les fichiers pour le prochain enregistrement.

- `git add` veut dire: "ajouter a la zone de preparation"
- le point `.` veut dire: "tous les fichiers du dossier courant"

Exemple:

```bash
git add .
```

### `git commit -m "message"`

Cette commande cree une sauvegarde officielle dans l'historique Git.

- `commit` = point de sauvegarde
- `-m` permet d'ajouter un message
- le message doit expliquer le changement

Exemple:

```bash
git commit -m "Ajoute la documentation du site"
```

### `git push`

Cette commande envoie les commits vers GitHub.

Exemple:

```bash
git push
```

En pratique, `git push` publie ton travail local vers le depot distant.

## 6. Flux de travail simple pour debutant

Quand tu modifies le site, utilise toujours cette sequence:

1. modifier les fichiers
2. enregistrer dans l'editeur
3. verifier avec `git status`
4. preparer avec `git add .`
5. sauvegarder avec `git commit -m "ton message"`
6. publier avec `git push`

Exemple complet:

```bash
git status
git add .
git commit -m "Corrige la page d'accueil"
git push
```

## 7. Comment publier sur GitHub Pages

GitHub Pages permet d'afficher ton site publiquement.

Dans ton cas, Pages est deja configure en deploiement automatique. Cela veut dire:

- tu fais un commit
- tu envoies les changements avec `git push`
- GitHub Pages recupere automatiquement la nouvelle version

Tu n'as donc pas besoin de republier manuellement a chaque fois.

### Ce qu'il faut faire au depart

1. Mettre le projet dans un depot GitHub.
2. Verifier dans les parametres du depot que GitHub Pages est active.
3. Choisir la branche de publication, souvent `main`.
4. Si `index.html` est a la racine, publier le dossier racine `/`.

### Adresse du site

GitHub Pages fournit ensuite une adresse du type:

```text
https://ton-utilisateur.github.io/nom-du-depot/
```

## 8. Pourquoi il y a `404.html`

Le fichier `404.html` sert a afficher une page propre si quelqu'un va sur une mauvaise adresse.

Sur GitHub Pages, ce fichier est souvent utile parce qu'il améliore l'experience utilisateur quand une page n'existe pas.

## 9. Ou sont definis les liens du site

Les liens principaux sont dans `script.js`.

Exemple:

```js
const liensDuProjet = {
  cagnotte: "https://app.lacagnottedesproches.fr/cagnotte/histoire-des-armeniens-de-stanoze/",
  livrePdf: "https://memoire-stanoze.org/wp-content/uploads/2026/06/Garabed-Terzian-Stanoze-version-complete-avec-photos-beta.pdf"
};
```

Le script remplace automatiquement les liens marqués avec `data-link`.

## 10. Conseils pour ne pas se perdre

- garde toujours une copie de travail dans Git
- fais un commit apres chaque changement important
- ecris des messages de commit courts et clairs
- teste le site en local avant de faire `git push`

Exemples de bons messages de commit:

- `Ajoute la documentation`
- `Corrige le menu mobile`
- `Met a jour les liens`
- `Ameliore la page d'accueil`

## 11. Resume ultra simple

Pour tester le site:

```text
ouvrir le dossier -> lancer le script -> verifier le site
```

Pour sauvegarder ton travail:

```text
git status -> git add . -> git commit -m "message" -> git push
```

Pour publier sur GitHub Pages quand le deploiement automatique est deja active:

```text
git push -> GitHub Pages met le site a jour automatiquement
```
