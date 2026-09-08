# OpsMaxx Homebrew tap

The macOS cask for [OpsMaxx](https://opsmaxx.dev) — a free, MIT-licensed SSH
client, SFTP browser, database manager, secrets vault and MCP gateway for AI
agents.

```bash
brew tap opsmaxx/tap
brew install --cask opsmaxx
```

Or in one line:

```bash
brew install --cask opsmaxx/tap/opsmaxx
```

## Why a tap rather than homebrew-cask

Homebrew's main cask repository applies a notability threshold that OpsMaxx
does not meet yet. This tap gives the same one-command install in the
meantime; the cask will be submitted upstream once the project qualifies.

## Upgrading

```bash
brew update && brew upgrade --cask opsmaxx
```

## Note on the first launch

The macOS build is ad-hoc signed rather than notarized, so macOS cannot confirm
who published it. Homebrew removes the quarantine flag when installing a cask,
so `brew install` sidesteps the warning you would see downloading the `.dmg` by
hand. Every release is scanned before publication and its SHA-256 is in the
release notes — the cask pins those hashes, so an altered download fails to
install.

Source: <https://github.com/OpsMaxx/OpsMaxx>
