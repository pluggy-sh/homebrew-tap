# typed: false
# frozen_string_literal: true

class Pluggy < Formula
  desc "Single-binary CLI for Minecraft plugin development"
  homepage "https://pluggy.sh"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-darwin-arm64"
      sha256 "9e83fc94e2a22bb489427e387eb72933c41308f4da8d08c67834c9aedc9544e2"
    end
    on_intel do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-darwin-amd64"
      sha256 "bc0fdc336f6fb734f01538aa8484b91a1a2e3d2357414d55fd3ce56d724ed38b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-linux-arm64"
      sha256 "b01b1bbcd57fd04a562dab760ce066d670eb9a21540fbe78f324c98da9647256"
    end
    on_intel do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-linux-amd64"
      sha256 "f56a02cd68b0fd911c518d7cbc0d3f0551b387dcba803ed7090f31498ad6ef27"
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
