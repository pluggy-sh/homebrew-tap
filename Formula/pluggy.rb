# typed: false
# frozen_string_literal: true

class Pluggy < Formula
  desc "Single-binary CLI for Minecraft plugin development"
  homepage "https://pluggy.sh"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-darwin-arm64"
      sha256 "43a35f3958714a3d88a37815047f317be115b60a1c99fece2ca63901b3ff15df"
    end
    on_intel do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-darwin-amd64"
      sha256 "c45c82b20b8c6c311ae83912fd9420c4504cf856055adeff9e7552a175988d50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-linux-arm64"
      sha256 "c1889ecb8534e8cd64a7ece3429adc19bb74a2b66d22069ed276e1967db5d1f6"
    end
    on_intel do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-linux-amd64"
      sha256 "32bd81132ef7a074ca8565c3543ebf4a49d74b86fed7dd81e0c437bc6a29a71a"
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
