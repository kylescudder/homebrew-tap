cask "spark-plug" do
  version "1.6.2"
  sha256 "fc9378007a0706abafe22e7242cbca6984d168aa313416e1f11f884774277bae"

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
