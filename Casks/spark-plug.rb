cask "spark-plug" do
  version "1.12.0"
  sha256 "c471bc6987bd18c38a312a83fc84f296bbb282e88d6e7d4b4ae989bb5f1e6e32"

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
