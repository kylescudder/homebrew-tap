cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.9"
  sha256 arm:   "02258793e4c86ae0dce7d2d6a9e78f786024c9c97b036da37dda6c27e1835ed7",
         intel: "1e06e5c6662c0979b9367576d6a7112ce33ceb0e4503bac17debeea6d60245df"

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
