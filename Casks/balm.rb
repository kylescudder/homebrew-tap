cask "balm" do
  version "0.11.3"
  sha256 "9c5e7440d6f5b485d6a38065da42b518b2ab5a9ed178bf162ac76a899c401d0d"

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
