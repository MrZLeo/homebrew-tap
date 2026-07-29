class Loupe < Formula
  desc "Terminal viewer for coding-agent session logs"
  homepage "https://github.com/mrzleo/loupe"
  url "https://github.com/mrzleo/loupe/releases/download/v0.3.0/loupe-v0.3.0-macos-universal.tar.gz"
  sha256 "cbc5fa07b06dfc9e4394912b262c50c5abeab4525dae81621a351d33dab0752b"
  license "BSD-3-Clause"

  depends_on macos: :ventura

  resource "license" do
    url "https://raw.githubusercontent.com/mrzleo/loupe/v0.3.0/LICENSE"
    sha256 "994fe9ecc9165d332eea21630058e4df1e4e9c3583c5bd2a4b9bcda54211b8a5"
  end

  def install
    bin.install "loupe"
    pkgshare.install "THIRD_PARTY_LICENSES.md"
    resource("license").stage { pkgshare.install "LICENSE" }
  end

  test do
    assert_match "loupe #{version}", shell_output("#{bin}/loupe --version")
  end
end
