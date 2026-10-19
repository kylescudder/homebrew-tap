cask "spark-plug" do
  version "1.11.0"
  sha256 "1e783352be0d900ff717fe631e752822f28be3508acb1453e998b128acc8400e"

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

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Spark Plug.app"]
  end

  zap trash: "~/Library/Preferences/co.uk.kylescudder.spark-plug.plist"
end
