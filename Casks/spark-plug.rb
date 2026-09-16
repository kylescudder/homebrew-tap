cask "spark-plug" do
  version "1.9.1"
  sha256 "406ae5e5d7e82647c54261629b1f4358ecaa8ad8b72687a0cc3eb0c012b210d6"

  url "https://github.com/kylescudder/spark-plug/releases/download/v#{version}/SparkPlug-#{version}.zip"
  name "Spark Plug"
  desc "Menubar launcher for coding-agent sessions in your worktrees"
  homepage "https://github.com/kylescudder/spark-plug"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Spark Plug.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Spark Plug.app"],
                   sudo: false
  end

  zap trash: "~/Library/Preferences/co.uk.kylescudder.spark-plug.plist"
end
