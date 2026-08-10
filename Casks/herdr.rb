cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.6"
  sha256 arm:   "8ec7a7047a9a8f501742faf7712c8bef1a606536defe12b5eb1701cf59bb734f",
         intel: "eda3bee0b079a24f8863964f06b4e41c1d75f875c71db90b919e90397b1a669c"

  url "https://github.com/kylescudder/herdr/releases/download/v#{version}/herdr-macos-#{arch}"
  name "herdr"
  desc "Terminal workspace manager for AI coding agents"
  homepage "https://github.com/kylescudder/herdr"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "herdr-macos-#{arch}", target: "herdr"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/herdr-macos-#{arch}"],
                   sudo: false
  end
end
