# dotfiles
kawamataryo's dotfiles managed by [chezmoi](https://www.chezmoi.io/) and pass.

## Get started

#### 1. Install chezmoi

```
brew install chezmoi
```

#### 2. Clone dotfiles

```
chezmoi init https://github.com/kawamataryo/dotfiles.git
```

#### 3. Login to 1password cli

```
# On bash
eval $(op signin my)

# On fish with fish-replay
replay 'eval $(op signin my)'
```

#### 4. Apply dotfiles

```
chezmoi apply
```
