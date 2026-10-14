# Billard français — Moi & Papa

Application web statique (HTML/CSS/JS) utilisable sur mobile et installable comme PWA.

## Publier gratuitement avec GitHub Pages
1. Crée/connecte-toi à https://github.com
2. Crée un nouveau dépôt public, par exemple `billard-francais`.
3. Téléverse les fichiers `index.html`, `manifest.webmanifest`, `sw.js` et `icon.svg` à la racine du dépôt.
4. Dans le dépôt, ouvre **Settings → Pages**.
5. Dans **Build and deployment**, choisis **Deploy from a branch**.
6. Choisis la branche `main` et le dossier `/ (root)`, puis clique **Save**.
7. Attends la publication. GitHub affichera une adresse de type `https://TON-PSEUDO.github.io/billard-francais/`.
8. Ouvre cette adresse sur ton téléphone.

## Ajouter à l'écran d'accueil
- Android (Chrome) : menu ⋮ → **Installer l'application** ou **Ajouter à l'écran d'accueil**.
- iPhone (Safari) : bouton Partager → **Sur l'écran d'accueil**.

## Données et sauvegardes
- Les données sont conservées localement dans le navigateur de cet appareil.
- Utilise **Historique → Exporter JSON** régulièrement.
- Pour transférer une sauvegarde, utilise **Importer une sauvegarde JSON**.
- L'historique d'une autre version n'est pas automatiquement transféré. Exporte-le depuis l'ancienne version puis importe-le dans cette version, si son format JSON est compatible.
- GitHub Pages ne fournit pas de base de données : cette version ne synchronise pas automatiquement les données entre plusieurs téléphones.

## Important
Cette app ne nécessite ni serveur PHP, ni base de données, ni clé API. HTTPS est fourni automatiquement par GitHub Pages.
