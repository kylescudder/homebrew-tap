cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.3"
  sha256 arm:   "1072c860784a0714059596bf941a0b2c7399c0ad34344d5f75369416ef5bcab8",
         intel: "344507bfd2e20bad5569c8bb0393dc8b858d3c3227de80d30688eaba38dfbb7c"

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
