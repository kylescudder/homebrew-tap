cask "herdr" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.10"
  sha256 arm:   "152b52f6be211974501e10db094dfa353b865cd3c60c053be7b96be3e02cad47",
         intel: "c599d1249e038ee02609e962b80f7d1b0db352544db57bdacab94212e3a315a2"

  url "https://github.com/kylescudder/herdr/releases/download/v#{version}/herdr-macos-#{arch}"
  name "herdr"
  desc "Terminal workspace manager for AI coding agents"
  homepage "https://github.com/kylescudder/herdr"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "herdr-macos-#{arch}", target: "herdr"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/herdr-macos-#{arch}"],
                   sudo: false
  end
end
