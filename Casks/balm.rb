cask "balm" do
  version "0.2.0"
  sha256 "390035e1260b7e52e4f8ef2043223e3dcc59e0e1505141c8996c0a5ca37dcd11"

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
