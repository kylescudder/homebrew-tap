cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.7"
  sha256 arm:   "50ad2535a06a2e81f0685c7e86687d880a012e832bec1919a420ed04d6bf9273",
         intel: "1f881a34837ced37fde5b098574c8cfd5d257b79e817486af0cd1557a627e401"

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
