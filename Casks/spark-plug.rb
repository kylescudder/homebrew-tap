cask "spark-plug" do
  version "1.6.0"
  sha256 "88b7708a17787749d33e83a3a239b1506e5034e5d07bf6e95f2477d6b5dcfb51"

  url "https://github.com/kylescudder/spark-plug/releases/download/v#{version}/SparkPlug-#{version}.zip"
  name "Spark Plug"
  desc "Menubar launcher for Claude Code sessions in your worktrees"
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
