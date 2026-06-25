cask "spark-plug" do
  version "1.5.0"
  sha256 "b7009061b219c61b2d807b9b9cca87af3ad400f4da75b39354f81e6851cb8cd7"

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
