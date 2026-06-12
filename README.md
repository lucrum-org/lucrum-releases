# Lumen

**A terminal that earns while you wait.**

[Lumen](https://lumen.terminal) is a full-screen terminal built for developers who live in the shell. While Claude, Codex, test suites, and deploys run, Lumen shows lightweight sponsor lines in the idle moments. You keep working. You keep **60% of the revenue**.

Stack enough and Lumen can cover part of your Claude and Codex bill each month.

## What Lumen is

Most terminals are great at emulation, but your day still collapses into an endless scrollback. Lumen treats commands as work artifacts: structured, searchable, and easy to resume, with a terminal that pays you back during the wait.

- **Real shell** — PTY-backed execution, full-screen apps (`claude`, `vim`, `ssh`, `top`, and more)
- **Command blocks** — every command gets exit status, runtime, working directory, and saved history
- **Search and export** — find past commands, output, and directories; export when you need a record
- **Keyboard-first TUI** — suggestions, command palette, and fast navigation
- **Earn on idle time** — sponsor lines appear while tools think, not while you type

## Downloads

Release binaries live on the **[Releases](https://github.com/lumen-terminal/lumen-releases/releases)** tab, not in this file tree.

### v0.1.0

| Platform | File |
|----------|------|
| macOS (Apple Silicon) | [lumen-aarch64-apple-darwin.tar.gz](https://github.com/lumen-terminal/lumen-releases/releases/download/v0.1.0/lumen-aarch64-apple-darwin.tar.gz) |
| macOS (Intel) | [lumen-x86_64-apple-darwin.tar.gz](https://github.com/lumen-terminal/lumen-releases/releases/download/v0.1.0/lumen-x86_64-apple-darwin.tar.gz) |
| Linux (ARM64) | [lumen-aarch64-unknown-linux-gnu.tar.gz](https://github.com/lumen-terminal/lumen-releases/releases/download/v0.1.0/lumen-aarch64-unknown-linux-gnu.tar.gz) |
| Linux (x86_64) | [lumen-x86_64-unknown-linux-gnu.tar.gz](https://github.com/lumen-terminal/lumen-releases/releases/download/v0.1.0/lumen-x86_64-unknown-linux-gnu.tar.gz) |
| macOS app (Apple Silicon) | [Lumen-macOS-aarch64.zip](https://github.com/lumen-terminal/lumen-releases/releases/download/v0.1.0/Lumen-macOS-aarch64.zip) |
| macOS app (Intel) | [Lumen-macOS-x86_64.zip](https://github.com/lumen-terminal/lumen-releases/releases/download/v0.1.0/Lumen-macOS-x86_64.zip) |

## Install

### Homebrew (recommended)

```sh
brew tap lumen-terminal/lumen
brew install --formula lumen-terminal   # CLI: lumen
brew install --cask lumen-terminal      # macOS app
```

### curl

```sh
curl -fsSL https://raw.githubusercontent.com/lumen-terminal/lumen-terminal/lumen-terminal/scripts/install-remote.sh | bash
```

### Manual

```sh
tar -xzf lumen-aarch64-apple-darwin.tar.gz   # pick your platform
chmod +x lumen
mv lumen ~/.local/bin/
```

On macOS, unzip `Lumen-macOS-*.zip` into `~/Applications` for the desktop app.

## Make it your default terminal

Add to `~/.zshrc`:

```sh
if command -v lumen >/dev/null 2>&1; then
  exec lumen
fi
```

## Links

- Website: [lumen.terminal](https://lumen.terminal)
- Homebrew tap: [lumen-terminal/homebrew-lumen](https://github.com/lumen-terminal/homebrew-lumen)
