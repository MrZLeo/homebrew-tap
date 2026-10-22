class Lupe < Formula
  desc "Terminal viewer for coding-agent session logs"
  homepage "https://github.com/mrzleo/lupe"
  url "https://github.com/mrzleo/lupe/releases/download/v0.7.0/lupe-v0.7.0-macos-universal.tar.gz"
  sha256 "32b11d475741e174a10b6ba4f1f552e7946f9cd67ad46c0ee3c62dd9e2532236"
  license "BSD-3-Clause"

  depends_on macos: :sequoia

  resource "license" do
    url "https://raw.githubusercontent.com/mrzleo/lupe/v0.7.0/LICENSE"
    sha256 "994fe9ecc9165d332eea21630058e4df1e4e9c3583c5bd2a4b9bcda54211b8a5"
  end

  def install
    bin.install "lupe" => "lupe"
    pkgshare.install "THIRD_PARTY_LICENSES.md"
    resource("license").stage { pkgshare.install "LICENSE" }
  end

  test do
    assert_match "lupe #{version}", shell_output("#{bin}/lupe --version")
  end
end
