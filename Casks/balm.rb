cask "balm" do
  version "0.1.1"
  sha256 "eb7b625a977f4c326fd3c2d311d92aa9c58151924757c58ee82b7011b988fc25"

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

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Balm.app"],
                   sudo: false
  end

  zap trash: "~/Library/Preferences/app.balm.plist"
end
