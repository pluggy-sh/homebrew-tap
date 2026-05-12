# typed: false
# frozen_string_literal: true

class Pluggy < Formula
  desc "Single-binary CLI for Minecraft plugin development"
  homepage "https://pluggy.sh"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-darwin-arm64"
      sha256 "049995471ce2f6d3a072ca51a2ebcfc2bd0db6b9692ac21286e6c27641b95616"
    end
    on_intel do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-darwin-amd64"
      sha256 "3535b83c73eaf30aa08e0a8e4d032b02b8c6dff196986628bd0b59010701ea46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-linux-arm64"
      sha256 "28892aa178c46c6832b2a6268d069713ba510a7e20ffa2ff3882c20aab36804c"
    end
    on_intel do
      url "https://github.com/pluggy-sh/pluggy/releases/download/v#{version}/pluggy-linux-amd64"
      sha256 "303524c7e31c79fc8651c245bdab4914171533be211663e8d7be43920a14972e"
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
