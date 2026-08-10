cask "balm" do
  version "0.9.0"
  sha256 "7bc37893303566dd40e0821396a73d8e15666b6f97fbc968e3a56f7f8606a29b"

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
