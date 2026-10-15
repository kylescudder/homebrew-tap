cask "balm" do
  version "0.11.4"
  sha256 "9c0f1dd34de4850235e34da125966ba2fbdffa514e530e70b3fe9efa7dde0254"

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
