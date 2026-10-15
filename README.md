# Billard français — version synchronisée Supabase

Webapp PWA hébergée sur GitHub Pages, avec historique commun privé accessible depuis plusieurs téléphones. Les deux personnes se connectent avec **le même compte Supabase**. Aucun serveur personnel ou abonnement nécessaire pour démarrer.

## 1. Créer le projet Supabase
1. Va sur https://supabase.com et crée un projet (note le mot de passe de la base dans un gestionnaire sécurisé).
2. Dans **SQL Editor**, crée une requête, colle le contenu de `schema.sql`, puis exécute-la.
3. Dans **Authentication → Users**, ajoute manuellement un utilisateur avec l’adresse e-mail et un mot de passe que vous partagerez uniquement entre vous deux. Si l’option d’inscription publique est activée, désactive-la dans les réglages d’authentification. L’application n’a pas de bouton d’inscription.
4. Dans **Project Settings → API** (ou **Data API / API Keys** selon l’interface), copie l’URL du projet et la clé publique **publishable** (`sb_publishable_...`) ou la clé `anon` historique. **Ne copie jamais la clé `service_role` ou une clé `secret`.**
5. Ouvre `config.js` et remplace `https://VOTRE-PROJET.supabase.co` et `COLLER_ICI_LA_CLE_PUBLISHABLE_OU_ANON` par tes valeurs. Garde les apostrophes et ne modifie pas le reste.

## 2. Publier sur GitHub Pages
1. Crée un dépôt GitHub public nommé `billard-francais` (GitHub Pages gratuit nécessite un dépôt public sur le plan gratuit standard).
2. Téléverse à la racine : `index.html`, `config.js`, `manifest.webmanifest`, `sw.js`, `icon.svg`. Tu peux aussi ajouter `schema.sql` et `README.md` (ils ne sont pas nécessaires au fonctionnement).
3. Ouvre **Settings → Pages → Build and deployment**. Choisis **Deploy from a branch**, branche `main`, dossier `/ (root)`, puis **Save**.
4. L’adresse publiée sera de la forme `https://TON-PSEUDO.github.io/billard-francais/`. Attends que GitHub indique que la publication est terminée.

## 3. Connexion sur les deux téléphones
1. Ouvre l’adresse GitHub Pages et connecte-toi avec le même e-mail et mot de passe Supabase sur les deux téléphones.
2. Installe la webapp : Android/Chrome → menu ⋮ → Installer l’application / Ajouter à l’écran d’accueil ; iPhone/Safari → Partager → Sur l’écran d’accueil.
3. Les matchs et noms sont enregistrés en ligne. Les changements apparaissent sur l’autre téléphone au prochain chargement/rafraîchissement. Il faut une connexion Internet pour consulter ou modifier les données cloud.

## 4. Importer les anciens résultats
Avant de remplacer l’ancienne version, ouvre-la sur l’appareil qui contient les résultats, puis **Historique → Exporter JSON**. Dans la nouvelle version connectée, va dans **Historique → Importer une sauvegarde JSON**. L’import remplace l’historique en ligne, donc fais-le une seule fois et avant de commencer à ajouter des parties sur les deux téléphones.

## Sécurité et sauvegarde
- `config.js` contient uniquement l’URL et la clé publique du projet ; elles peuvent être visibles dans le dépôt. La sécurité vient des politiques RLS du fichier `schema.sql` et de l’authentification.
- Ne publie jamais une clé `service_role`/`secret`.
- Le compte partagé donne le même niveau d’accès aux deux personnes : chacune peut ajouter, modifier ou supprimer des parties.
- Utilise **Exporter JSON** de temps en temps pour garder une sauvegarde indépendante.
- Le service worker met en cache l’interface, pas les réponses privées de Supabase. Une connexion Internet est nécessaire pour charger et enregistrer l’historique.
- Si tu modifies le code après publication, le service worker a été versionné pour forcer le renouvellement du cache ; si un téléphone affiche encore l’ancienne version, ferme/réouvre la webapp ou recharge la page.
