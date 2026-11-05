class SpotifyTui < Formula
  desc "Local-first terminal Spotify interface powered by spotifyd"
  homepage "https://github.com/kylescudder/spotify-tui"
  url "https://github.com/kylescudder/spotify-tui/releases/download/v0.1.0/spotify-tui-source.tar.gz"
  sha256 "a1d6ab5709d7a9cd9e8ae3aa2c1c3df24ce9bd020240640420c474aa925c0c7c"
  license all_of: ["MIT", "GPL-3.0-only"]

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "openssl@3"

  conflicts_with "spotifyd", because: "both install a `spotifyd` binary"

  resource "spotifyd" do
    url "https://github.com/Spotifyd/spotifyd/archive/c5b94367014856a8c541dea565cbd332e034fb9e.tar.gz"
    sha256 "d711e441d709e76f93b4ab297782d01dee6aa166e4015746fd5230d61fcaba71"
  end

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
    pkgshare.install "themes"

    resource("spotifyd").stage do
      system "sh", buildpath/"packaging/spotifyd/apply-local-control.sh", "."
      system "cargo", "install", "--locked", "--root", buildpath/"spotifyd-install",
             "--path", ".", "--no-default-features", "--features", "rodio_backend,local_control"
    end
    bin.install buildpath/"spotifyd-install/bin/spotifyd"
  end

  service do
    run [opt_bin/"spotifyd", "--no-daemon"]
    keep_alive true
    process_type :background
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spotify-tui --version")
  end
end
