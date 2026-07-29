cask "spark-plug" do
  version "1.8.0"
  sha256 "ec0532fa394f167e791b6d9a9cbfad903fbff4d3ecb798e08e94e60ff42423d3"

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
