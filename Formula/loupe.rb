class Loupe < Formula
  desc "Terminal viewer for coding-agent session logs"
  homepage "https://github.com/mrzleo/loupe"
  url "https://github.com/mrzleo/loupe/releases/download/v0.4.0/loupe-v0.4.0-macos-universal.tar.gz"
  sha256 "647785d3bdc16ba3125b3e63fc094ba174a305dea336a9f6b44fddafa77623d6"
  license "BSD-3-Clause"

  depends_on macos: :ventura

  resource "license" do
    url "https://raw.githubusercontent.com/mrzleo/loupe/v0.4.0/LICENSE"
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
