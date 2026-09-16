cask "balm" do
  version "0.11.1"
  sha256 "1fb35941e7f2502a233c696e28e3e966c1dd9d981b6d5c553e1daa6e326dbef3"

  url "https://github.com/kylescudder/balm/releases/download/v#{version}/Balm-#{version}-macos.zip"
  name "Balm"
  desc "Native, keyboard-driven SwiftUI client for Jira Cloud"
  homepage "https://github.com/kylescudder/balm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Balm.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Balm.app"]
  end

  zap trash: "~/Library/Preferences/app.balm.plist"
end
