cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.9.2"
  sha256 arm:   "1f9f01a4379bfc401cc655c33f1d08ee0b65397676e34b832b0006099f93ebf5",
         intel: "039590b2f1cdbff2c1b3b206d0ba23fd43aa5318bf6f607b003fc4a5f0243cb7"

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
