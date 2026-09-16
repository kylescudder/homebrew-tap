cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.9.3"
  sha256 arm:   "314253b344948437fb892ff0b18f7ae6d3ef1fdc43b98b94dea22426d9683a60",
         intel: "6f1c31a5f2aba358412c650358dddd79a02dcaa35ddeeab652e44b7790ed7be9"

  url "https://github.com/kylescudder/herdr/releases/download/v#{version}/herdr-macos-#{arch}"
  name "herdr"
  desc "Terminal workspace manager for AI coding agents"
  homepage "https://github.com/kylescudder/herdr"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "herdr-macos-#{arch}", target: "herdr"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/herdr-macos-#{arch}"]
  end
end
