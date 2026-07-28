cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.2"
  sha256 arm:   "3cceca736e19135b098d102bd733689f72e66d6c0571376efb7486ea1dd1e176",
         intel: "a9c8231be7fa95cb8b323fb5552318c19be21bd9a2fd2f3c5f4cbd69a867e494"

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
