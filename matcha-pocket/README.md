# Matcha Pocket — Le jardin d’Élodie

Application web personnelle responsive en français, HTML/CSS/JavaScript natif. Aucun compte, aucune publicité, aucune dépendance réseau ou police externe. Les données commencent à zéro.

## Démarrer sur un ordinateur

1. Dézipper le dossier.
2. Avec Python 3 installé, ouvrir un terminal dans ce dossier.
3. Lancer `python -m http.server 8000` (ou `python3 -m http.server 8000`).
4. Ouvrir http://localhost:8000 dans Chrome, Firefox ou Edge.

Ne pas ouvrir index.html par double-clic : les modules JavaScript nécessitent un serveur HTTP. Sous Windows, `demarrer.bat` lance le serveur si Python est installé.

## Installer sur Android

Ce projet est une PWA (application web installable), pas un APK.

1. Copier les fichiers de l’application sur un hébergement statique en HTTPS, à la racine ou dans un sous-dossier. Aucun build requis. À publier : index.html, style.css, app.js, model.js, sw.js, manifest.webmanifest, icon.svg, icon-192.png, icon-512.png.
2. Ouvrir l’adresse HTTPS dans Chrome sur Android. Attendre le chargement initial en ligne.
3. Menu ⋮ → Ajouter à l’écran d’accueil → Installer (le libellé dépend du navigateur). Un bouton peut également apparaître dans les réglages de l’application.
4. Lancer depuis l’icône. Les ressources sont mises en cache pour fonctionner hors ligne.

L’application n’a pas été publiée. L’installation et le fonctionnement hors ligne doivent encore être vérifiés sur le téléphone d’Élodie, après hébergement HTTPS. Une adresse HTTP locale sur le réseau ne suffit pas pour activer une PWA sur Android.

## Fonctionnalités

- Accueil, objectif d’épargne et résumé du mois.
- Revenus mensuels et charges fixes prévues configurables.
- Dépenses datées, catégories, consultation par mois, suppression avec confirmation.
- Tirelire : achats évités et argent réellement mis de côté séparés.
- Confirmation manuelle de mise de côté. Aucun virement bancaire réel.
- Liste d’envies : conserver une envie, y revenir après une journée, transformer en dépense ou en achat évité.
- Pause : suggestions selon faim, croquant, envie de mâchouiller, besoin de réconfort ou envie d’achat.
- Feuilles : 1 € réellement épargné = 1 feuille (arrondi inférieur sur le cumul). Récompenses facultatives : café, soirée cocon, balade.
- Prix et seuil du café personnalisables. Le café choisi crée une dépense ; les autres idées sont gratuites.
- Export JSON, import validé et remise à zéro avec confirmation.
- Mise à jour entre onglets, protection contre un fichier de sauvegarde invalide, échappement des textes saisis.

## Règles des calculs

Les montants des entrées sont stockés en centimes entiers pour éviter les erreurs d’arrondi.

Disponible du mois = revenus prévus − charges fixes prévues − dépenses du mois − épargne confirmée des entrées datées de ce mois.

Les revenus/charges sont des repères communs à tous les mois, pas des écritures bancaires historiques. Modifier ces réglages recalcule donc les mois affichés. Ne pas enregistrer deux fois une charge fixe prévue.

Une confirmation d’épargne conserve la date de l’achat évité. Pour une mise de côté différée, utiliser la date de mise de côté lors de la création si le budget du mois doit en tenir compte.

La tirelire représente le cumul des sommes déclarées mises de côté, sans suivi des retraits bancaires. Ce n’est pas un solde bancaire. Supprimer une entrée corrige ce cumul et ses feuilles ; les récompenses déjà choisies restent dans l’historique. Les feuilles disponibles ne deviennent pas négatives.

3 matchas × 4,50 € = 13,50 € par semaine ; quatre semaines = 54 €.

## Données et confidentialité

Les données sont conservées dans localStorage, sur le navigateur et l’origine du site. Elles ne sont pas chiffrées par l’application. Aucun envoi à un serveur applicatif, aucune synchronisation entre appareils. L’hébergeur peut avoir ses journaux techniques usuels.

Exporter régulièrement depuis Réglages. Effacer les données du navigateur, changer d’origine/domaine ou changer de téléphone peut rendre le journal inaccessible. Restaurer le JSON sur le nouvel appareil. Ne pas utiliser la navigation privée pour un journal durable. Protéger les fichiers exportés.

Le design calme, les messages sans jugement et les récompenses sans pénalités sont des choix d’ergonomie. L’application n’est pas un dispositif médical, ni une prise en charge de la bipolarité. Aucune donnée de santé n’est enregistrée.

## Fichiers et personnalisation

- `index.html` : structure principale.
- `style.css` : thème crème/matcha, variantes tablette et mobile, navigation basse Android.
- `app.js` : interface, formulaires, sauvegardes, événements.
- `model.js` : calculs et validation.
- `model.test.js` : tests unitaires.
- `sw.js` : cache hors ligne ; augmenter CACHE lors d’une nouvelle version des ressources.
- `manifest.webmanifest` et icônes : installation PWA.

Pour modifier les suggestions, éditer `pauseIdeas` dans app.js. Pour modifier les couleurs, éditer les variables CSS dans :root.

## Vérifications

`node --test model.test.js` avec Node.js récent (aucune installation npm nécessaire).

Tests réalisés : calculs en centimes, distinction achats évités/épargne, séparation des mois, points consommés, validation et rejet des sauvegardes incorrectes. Vérification de syntaxe de app.js. Dans le navigateur : rendu bureau, ajout d’un achat évité, totaux attendus, persistance après rechargement et ouverture des réglages. Les tests sur téléphone Android physique et le mode avion restent à effectuer après hébergement.
