# dotfiles

My dotfiles managed by [chezmoi](https://www.chezmoi.io/).

If you want to use my dotfiles in your environment, run:

```bash
chezmoi init --apply git@github.com:BlockLune/dotfiles.git
```

And change the repo address to your own:

```bash
git remote rm origin
git remote add git@github.com:$YOUR_GITHUB_USERNAME/dotfiles.git
git push -u main
```
