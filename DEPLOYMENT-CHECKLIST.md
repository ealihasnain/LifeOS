# Deployment verification checklist

- [ ] Root URL loads without a 404.
- [ ] DevTools → Application → Manifest shows LifeOS and all icons.
- [ ] DevTools → Application → Service Workers shows `sw.js` activated.
- [ ] Reload once, disconnect the network, and confirm the app shell still opens.
- [ ] Browser menu offers Install app / Add to Home screen.
- [ ] Create a test task, reload, and confirm localStorage data persists.
- [ ] Export a JSON backup before using real personal data.
