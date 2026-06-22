# LifeOS v2.10.81 — GitHub Pages package

This repository is ready to publish as a static GitHub Pages site and an installable Progressive Web App (PWA).

## What was changed

- The original single-file LifeOS application was renamed to `index.html`.
- The page title was updated to `LifeOS v2.10.81`.
- The embedded data-URL manifest was replaced with `manifest.webmanifest`.
- Proper 192 px, 512 px, maskable, Apple touch, and favicon assets were added.
- `sw.js` was added for installability and offline app-shell loading.
- `.nojekyll` prevents GitHub Pages from processing the static files through Jekyll.

The LifeOS application logic and localStorage data model were not refactored.

## Publish with the GitHub website

1. Sign in to GitHub and create a new repository, for example `lifeos`.
2. Choose **Public** unless your GitHub plan supports Pages for private repositories.
3. Extract the package ZIP on your computer.
4. In the empty repository, choose **Add file → Upload files**.
5. Upload the contents of this folder, including `index.html`, `manifest.webmanifest`, `sw.js`, `.nojekyll`, and the folders.
6. Commit the files to the `main` branch.
7. Open **Settings → Pages**.
8. Under **Build and deployment**, select **Deploy from a branch**.
9. Select branch **main**, folder **/(root)**, then click **Save**.
10. GitHub will show the published URL after deployment, normally:

       https://YOUR-USERNAME.github.io/lifeos/

## Publish with Git from Windows CMD

Create the empty GitHub repository first, then open CMD in this extracted folder and run:

    git init
    git add .
    git commit -m "Deploy LifeOS v2.10.81"
    git branch -M main
    git remote add origin https://github.com/YOUR-USERNAME/lifeos.git
    git push -u origin main

Then complete **Settings → Pages → Deploy from a branch → main → /(root)**.

You can also run `tools\publish.cmd`; it will prompt for the repository URL and perform the Git commands.

## Installing the app

Open the published HTTPS URL in Chrome or Edge. Once the manifest, icons, and service worker have loaded, use LifeOS's install action or the browser's **Install app / Add to Home screen** option.

For the first install test, load the site once, refresh it, and then check the browser menu. On iPhone/iPad, use Safari's **Share → Add to Home Screen**; Chromium browsers on iOS do not expose the same install prompt.

## Important data limitation

LifeOS currently stores user data in the browser's localStorage. Hosting the code does **not** create accounts, cloud backup, or cross-device synchronization. Data remains tied to each browser profile unless exported and imported manually. Clearing site data can erase local records.

## Updating later

Replace `index.html` with the next tested LifeOS version, preserve the PWA files, and update the cache name in `sw.js` so installed copies refresh cleanly. Then commit and push again.

## User guide

The deployed package includes `guide.html`, linked from the in-app About page. It covers setup, task management, filters, progress tracking, alarms, food and workout logging, English Lab, backups, recovery, offline behavior and troubleshooting.
