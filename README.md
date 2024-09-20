# My Neovim Setup 2024

## Installation Requirement

### Package Manager

Like [Chocolatey](https://chocolatey.org/) to install dependencies.

### True Color Terminal

"True color" means that you can display 16 million different colors at the same time.
I am using [WezTerm](https://wezfurlong.org/wezterm/index.html) for this setup.

```bash
choco install wezterm

```

### Nerd Font

To display icons properly.
I used [MesloLGS Nerd Font Mono](https://www.nerdfonts.com/font-downloads).

### Neovim (of course)

```bash
choco install neovim
```

### Ripgrep

For plugins that provides search functionality.

```bash
choco install ripgrep
```

### Node

to run npm command.

```bash
choco install nodejs
```

### I referenced [Josean Martinez](https://www.josean.com/)'s [Setup](https://www.josean.com/posts/how-to-setup-neovim-2024) as the starter kit.
## Trouble Shooting (known errors)
### OpenSSL SSL_read: SSL_ERROR_SYSCALL, errno 0 ...
Config Git to use cert.pm
```bash
git config --global http.sslBackend "openssl"
git config --global http.sslCAInfo "your\path\to\cert.pem"
```
The path to cert.pem might look like this: `C:\Program Files\Git\mingw64\ssl\cert.pem`
#### NOTE: DO NOT SET `http.sslVerify` to `false` as it defeats the purpose of HTTPS/SSL
