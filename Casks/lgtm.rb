cask "lgtm" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/kylescudder/lgtm/releases/download/v#{version}/lgtm-#{version}-macos.zip"
  name "LGTM"
  desc "Native client for reviewing and approving Azure DevOps pull requests"
  homepage "https://github.com/kylescudder/lgtm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "lgtm.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/lgtm.app"],
                   sudo: false
  end

  zap trash: "~/Library/Preferences/co.uk.kylescudder.lgtm.plist"
end
