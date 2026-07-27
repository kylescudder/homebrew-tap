class Schmerdr < Formula
  desc "Template-driven workspace launcher for herdr"
  homepage "https://github.com/kylescudder/schmerdr"
  url "https://github.com/kylescudder/schmerdr/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "68e9798e3e37de4812f21637e5e6de73750af537de41250ce691eace134836dc"
  license "MIT"

  depends_on "jq"

  def install
    libexec.install "schmerdr.sh", "util", "example.sh"
  end

  def caveats
    <<~EOS
      schmerdr is a shell function, not a standalone binary. Source it from your
      shell profile (e.g. add to ~/.zshrc):

        source "#{opt_libexec}/schmerdr.sh"

      Then reload your shell and run `schmerdr help`.

      Requires `herdr` on your PATH. Layouts are stored in
      ~/.config/schmerdr/layouts (override with SCHMERDR_LAYOUTS).
    EOS
  end

  test do
    assert_path_exists libexec/"schmerdr.sh"
    output = shell_output("/bin/bash -c 'source #{libexec}/schmerdr.sh && type schmerdr'")
    assert_match "schmerdr", output
  end
end
