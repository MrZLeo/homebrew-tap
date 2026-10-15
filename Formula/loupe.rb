class Loupe < Formula
  desc "Terminal viewer for coding-agent session logs"
  homepage "https://github.com/mrzleo/loupe"
  url "https://github.com/mrzleo/loupe/releases/download/v0.6.0/loupe-v0.6.0-macos-universal.tar.gz"
  sha256 "4ab00b54059307873de724bf3d9667fc4b90b1ecf10d536457d4c0653c2c19cc"
  license "BSD-3-Clause"

  depends_on macos: :ventura

  resource "license" do
    url "https://raw.githubusercontent.com/mrzleo/loupe/v0.6.0/LICENSE"
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
