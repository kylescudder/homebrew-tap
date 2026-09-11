cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.9.1"
  sha256 arm:   "87a820c12cefa9a8a89d02344f703f083f7bdc4588f6cd5435c8db0303b7a072",
         intel: "f5cfd63e2b05f5e2754f2b00303b78fe2c8c9076c6fc602cd5275072c5991c82"

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
