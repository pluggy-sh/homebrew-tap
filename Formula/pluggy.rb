# typed: false
# frozen_string_literal: true

class Pluggy < Formula
  desc "Single-binary CLI for Minecraft plugin development"
  homepage "https://pluggy.sh"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-darwin-arm64"
      sha256 "7c474c9d2d25d699c08343fed6816993d237610bf0fd3a3f0b4622da13e333bf"
    end
    on_intel do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-darwin-amd64"
      sha256 "9a08180b32e94b314943f8f9ddf1a8ac0366a3090b67cd5248f5f7f345256861"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-linux-arm64"
      sha256 "a5900b7a57118fca558b82fbdc80ccb4f67683173fcd455f501738d0b9831d46"
    end
    on_intel do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-linux-amd64"
      sha256 "c16a0060c3499e122a10580b74bf02a3175639e7638a9ea4a65e7184f47d4f13"
    end
  end

  # The downloaded file is whatever the URL's basename is (pluggy-darwin-arm64,
  # etc.); rename it to `pluggy` on the way into bin/.
  def install
    binary = Dir["pluggy-*"].first
    bin.install binary => "pluggy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pluggy --version")
  end
end
