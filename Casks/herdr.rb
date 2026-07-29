cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.4"
  sha256 arm:   "fb519e162c18c5a036b94f2ca9dddd096d637974d70e062cfd98e11e99623e50",
         intel: "d3e2e28131628ea62ccf1bc1980856b290bdf7d9253c697d9d031cacbee6ee30"

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
