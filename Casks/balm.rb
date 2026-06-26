cask "balm" do
  version "0.6.0"
  sha256 "e377d5abf68d9415748b3727d7f3cdcfb34a5fb969b1fc6a9e4721d1a76edc28"

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
