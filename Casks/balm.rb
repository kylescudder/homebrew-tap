cask "balm" do
  version "0.11.2"
  sha256 "d77dca5ed9fb54dee73faa30641a77cafe5496ad192675e9acb16d76c014fb08"

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
