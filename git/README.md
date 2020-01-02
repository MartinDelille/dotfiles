# Git configuration

## Signing commit

Usefull links:
- <https://medium.com/@rwbutler/signing-commits-using-gpg-on-macos-7210362d15>
- <https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e>

## Transperfect configuration

Add SSH key:

```
ssh-add -K ~/.ssh/id_rsa_tp
```

### Setup transperfect repositofy

```
git config --local --add user.email "mdelille@transperfect.com"
git config --local --add user.signingkey FFBBBD87E9227E2D
git config --local --add commit.template "~/.dotfiles/git/template-transperfect-commit.file"
```
