# OpsMaxx Homebrew tap

The macOS cask for [OpsMaxx](https://opsmaxx.dev) — a free, MIT-licensed SSH
client, SFTP browser, database manager, secrets vault and MCP gateway for AI
agents.

```bash
brew trust opsmaxx/tap
brew install --cask opsmaxx/tap/opsmaxx
```

The `brew trust` step is not optional. Homebrew refuses to load casks from a
third-party tap until you say you trust it, and without it the install stops
with `Refusing to load cask ... from untrusted tap`. That check is Homebrew
protecting you from arbitrary Ruby in someone else's repository; the cask it
guards is [six lines of metadata](Casks/opsmaxx.rb) you can read first.

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
