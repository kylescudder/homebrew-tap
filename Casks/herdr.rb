cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.5"
  sha256 arm:   "0ab60c91d980176e5dd034644398184d617135931f74b1a045d36f6a92145be8",
         intel: "3e7aa44d88b4bace2b5c394383e110e41621226ac1ea4575a186b9ee9521f2a0"

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
