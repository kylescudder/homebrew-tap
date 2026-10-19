cask "spark-plug" do
  version "1.10.0"
  sha256 "c720156ad2338aa118c95499928cafde3ff8f2f257e7a46c068aae5ad40c5e6f"

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
