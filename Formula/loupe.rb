class Loupe < Formula
  desc "Terminal viewer for coding-agent session logs"
  homepage "https://github.com/mrzleo/loupe"
  url "https://github.com/mrzleo/loupe/releases/download/v0.5.0/loupe-v0.5.0-macos-universal.tar.gz"
  sha256 "c046f189a1ddc6c905b83b67e2a86eaa01967aea2da9f45e62734324f9296144"
  license "BSD-3-Clause"

  depends_on macos: :ventura

  resource "license" do
    url "https://raw.githubusercontent.com/mrzleo/loupe/v0.5.0/LICENSE"
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
