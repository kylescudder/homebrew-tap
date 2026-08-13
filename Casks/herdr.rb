cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.8"
  sha256 arm:   "a310b8f06c98de0afaa897d1bf076601fa8b058bbc0c0b869b565f308424fd58",
         intel: "ac903926cf9f84886dc09af8808c6b1c7b21998415936a90bebd88bdc58bc29a"

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
