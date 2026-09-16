cask "balm" do
  version "0.11.0"
  sha256 "4904f1cea0d4b4f57bd77d4e1cda7934593e2f21f6a3ec059499297b8058ca47"

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
