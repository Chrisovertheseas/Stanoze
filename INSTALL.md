# Installation sur Windows

Ce guide explique comment lancer le site sur un ordinateur Windows qui n'a pas encore de configuration de developpement.

## 1. Installer Python

Le site utilise Python uniquement pour lancer un petit serveur local.

1. Ouvrez cette page : <https://www.python.org/downloads/>
2. Cliquez sur **Download Python**.
3. Lancez le fichier d'installation telecharge.
4. Cochez **Add python.exe to PATH** en bas de la fenetre d'installation.
5. Cliquez sur **Install Now**.
6. Attendez la fin de l'installation, puis fermez l'installateur.

## 2. Verifier que Python fonctionne

1. Ouvrez le menu Windows.
2. Tapez `cmd`.
3. Ouvrez **Invite de commandes**.
4. Tapez :

```bat
python --version
```

Si une version de Python s'affiche, l'installation est correcte.

Si la commande ne fonctionne pas, essayez :

```bat
py --version
```

Si aucune des deux commandes ne fonctionne, reinstallez Python en verifiant bien que l'option **Add python.exe to PATH** est cochee.

## 3. Recuperer le dossier du site

Placez le dossier du site sur l'ordinateur, par exemple dans :

```text
C:\Users\VotreNom\Documents\SiteWeb
```

Le dossier doit contenir au minimum ces fichiers :

```text
index.html
styles.css
script.js
lancer-site.bat
assets
```

## 4. Lancer le site

1. Ouvrez le dossier du site dans l'Explorateur Windows.
2. Double-cliquez sur `lancer-site.bat`.
3. Une fenetre noire s'ouvre.
4. Le navigateur s'ouvre automatiquement sur :

```text
http://127.0.0.1:4173/
```

Gardez la fenetre noire ouverte tant que vous utilisez le site.

## 5. Arreter le site

Dans la fenetre noire, appuyez sur :

```text
Ctrl+C
```

Si Windows demande de confirmer l'arret, tapez :

```text
O
```

puis appuyez sur **Entree**.

## Probleme frequent : le navigateur ne s'ouvre pas

Si le navigateur ne s'ouvre pas automatiquement, ouvrez manuellement cette adresse :

```text
http://127.0.0.1:4173/
```

## Probleme frequent : Python n'est pas reconnu

Si le fichier `lancer-site.bat` affiche que Python est requis :

1. Reinstallez Python depuis <https://www.python.org/downloads/>.
2. Cochez **Add python.exe to PATH**.
3. Redemarrez l'ordinateur.
4. Relancez `lancer-site.bat`.

