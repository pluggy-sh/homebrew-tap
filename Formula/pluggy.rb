# typed: false
# frozen_string_literal: true

class Pluggy < Formula
  desc "Single-binary CLI for Minecraft plugin development"
  homepage "https://pluggy.sh"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-darwin-arm64"
      sha256 "452f7805e09ec6511c39b69c336f743db8d3761e77cfb4596702c312e01dc642"
    end
    on_intel do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-darwin-amd64"
      sha256 "9e9a558a9fa04ceb9330bc0f1e8a14e732fa2e5c52c4a45961416d3c8c15940d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-linux-arm64"
      sha256 "265a9caf13fea368b054aac6e3f590496161a48ca27801b3333a90bb34303618"
    end
    on_intel do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-linux-amd64"
      sha256 "6d945b716ab58ed5cd39454e5346d19976f7170afee9c4fef4e81124e3382880"
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
