# Lucrum

**A terminal that earns while you wait.**

[Lucrum](https://joinlucrum.com) is a full-screen terminal built for developers who live in the shell. While Claude, Codex, test suites, and deploys run, Lucrum shows lightweight sponsor lines in the idle moments. You keep working. You keep **60% of the revenue**.

Stack enough and Lucrum can cover part of your Claude and Codex bill each month.

## What Lucrum is

Most terminals are great at emulation, but your day still collapses into an endless scrollback. Lucrum treats commands as work artifacts: structured, searchable, and easy to resume, with a terminal that pays you back during the wait.

- **Real shell** — PTY-backed execution, full-screen apps (`claude`, `vim`, `ssh`, `top`, and more)
- **Command blocks** — every command gets exit status, runtime, working directory, and saved history
- **Search and export** — find past commands, output, and directories; export when you need a record
- **Keyboard-first TUI** — suggestions, command palette, and fast navigation
- **Earn on idle time** — sponsor lines appear while tools think, not while you type

## Downloads

Release binaries live on the **[Releases](https://github.com/lucrum-org/lucrum-releases/releases)** tab, not in this file tree.

### v0.1.2

| Platform | File |
|----------|------|
| macOS (Apple Silicon) | [lucrum-aarch64-apple-darwin.tar.gz](https://github.com/lucrum-org/lucrum-releases/releases/download/v0.1.2/lucrum-aarch64-apple-darwin.tar.gz) |
| macOS (Intel) | [lucrum-x86_64-apple-darwin.tar.gz](https://github.com/lucrum-org/lucrum-releases/releases/download/v0.1.2/lucrum-x86_64-apple-darwin.tar.gz) |
| Linux (ARM64) | [lucrum-aarch64-unknown-linux-gnu.tar.gz](https://github.com/lucrum-org/lucrum-releases/releases/download/v0.1.2/lucrum-aarch64-unknown-linux-gnu.tar.gz) |
| Linux (x86_64) | [lucrum-x86_64-unknown-linux-gnu.tar.gz](https://github.com/lucrum-org/lucrum-releases/releases/download/v0.1.2/lucrum-x86_64-unknown-linux-gnu.tar.gz) |
| macOS app (Apple Silicon) | [Lucrum-macOS-aarch64.zip](https://github.com/lucrum-org/lucrum-releases/releases/download/v0.1.2/Lucrum-macOS-aarch64.zip) |
| macOS app (Intel) | [Lucrum-macOS-x86_64.zip](https://github.com/lucrum-org/lucrum-releases/releases/download/v0.1.2/Lucrum-macOS-x86_64.zip) |

## Install

### Homebrew (recommended)

```sh
brew tap lucrum-org/lucrum
brew install --formula lucrum-terminal   # CLI: lucrum
brew install --cask lucrum-terminal      # macOS app
```

### curl

```sh
curl -fsSL https://raw.githubusercontent.com/lucrum-org/lucrum-releases/main/scripts/install-remote.sh | bash
```

### Manual

```sh
tar -xzf lucrum-aarch64-apple-darwin.tar.gz   # pick your platform
chmod +x lucrum
mv lucrum ~/.local/bin/
```

On macOS, unzip `Lucrum-macOS-*.zip` into `~/Applications` for the desktop app.

## Make it your default terminal

Add to `~/.zshrc`:

```sh
if command -v lucrum >/dev/null 2>&1; then
  exec lucrum
fi
```

## Links

- Website: [joinlucrum.com](https://joinlucrum.com)
- Homebrew tap: [lucrum-org/homebrew-lucrum](https://github.com/lucrum-org/homebrew-lucrum)
