cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.1"
  sha256 arm:   "d7d503769dddfb60bd51c251879ac604d28522d4a89008ab7866c2564200db3e",
         intel: "82f5193a8c898ff5508728ea426bfa3c8be30b8a19b82c5a9e7d153728b56806"

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
