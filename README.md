# pluggy-sh/homebrew-tap

A [Homebrew](https://brew.sh) tap for [pluggy](https://github.com/pluggy-sh/pluggy), the single-binary CLI for Minecraft plugin development.

## Install

```sh
brew install pluggy-sh/tap/pluggy
```

That installs the latest `pluggy` binary and puts it on your `PATH`. Upgrade with:

```sh
brew upgrade pluggy
```

## Why not `brew install pluggy` directly?

`brew install pluggy` (no tap prefix) requires submission to [`homebrew/homebrew-core`](https://github.com/Homebrew/homebrew-core), which has [eligibility requirements](https://docs.brew.sh/Acceptable-Formulae) like 75+ stars, 30+ forks, a year of stable releases, and an active maintainer base. We'll submit when pluggy meets the bar; until then, the tap is the official channel.

## How it works

The formula in `Formula/pluggy.rb` downloads the platform-specific precompiled binary from a [GitHub release](https://github.com/pluggy-sh/pluggy/releases) of `pluggy-sh/pluggy` and installs it as `bin/pluggy`. Each platform has its own `url` and `sha256`. No build step, no Java dependency — pluggy provisions its own JDK on first use.

Supported platforms:

| OS    | Arch         | Asset                      |
| ----- | ------------ | -------------------------- |
| macOS | Apple Silicon | `pluggy-darwin-arm64`     |
| macOS | Intel         | `pluggy-darwin-amd64`     |
| Linux | arm64         | `pluggy-linux-arm64`      |
| Linux | x86_64        | `pluggy-linux-amd64`      |

## Updating the formula

Each new `pluggy-sh/pluggy` release fires a `repository_dispatch` that opens a PR here bumping `version` + `sha256` for every platform. Merge and `brew upgrade pluggy` rolls out worldwide.

To bump by hand:

```sh
# Get the new version's checksums
curl -sL https://github.com/pluggy-sh/pluggy/releases/download/vX.Y.Z/SHA256SUMS.txt
# Edit Formula/pluggy.rb with the new version + sha256 values, commit, push.
```

## License

MIT — see [LICENSE](./LICENSE).
