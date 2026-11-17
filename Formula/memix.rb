class Memix < Formula
  desc "Immutable local memory and context store CLI"
  homepage "https://github.com/MrZLeo/memix"
  url "https://github.com/MrZLeo/memix/releases/download/v0.7.0/memix-cli-skill.tar.gz"
  sha256 "d903f360443cf763be9e17c3c18602761cf791878db57597667c3e516a1b2422"
  license "BSD-3-Clause"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :tahoe

    resource "binary" do
      url "https://github.com/MrZLeo/memix/releases/download/v0.7.0/memix-macos-arm64"
      sha256 "bab3ef037ab2333c3a1eedf75095d6a23cf8a31b07516a438b68fa6c7b20043b"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    resource "binary" do
      url "https://github.com/MrZLeo/memix/releases/download/v0.7.0/memix-linux-x86_64"
      sha256 "5a4796a257bcbd82c36b76b5639c9a6075d1a867e83ba5edf8a415f51b82b063"
    end
  end

  resource "license" do
    url "https://raw.githubusercontent.com/MrZLeo/memix/v0.7.0/LICENSE"
    sha256 "40a36802c862a18bc9f8d262f4a8af8e5f2ebc53820e8e68adc0158c3af67d0a"
  end

  def install
    binary = OS.mac? ? "memix-macos-arm64" : "memix-linux-x86_64"
    resource("binary").stage { bin.install binary => "memix" }
    resource("license").stage { pkgshare.install "LICENSE" }
  end

  test do
    assert_match "memix #{version}", shell_output("#{bin}/memix --version")

    (testpath/"input.txt").write "hello from homebrew\n"
    store_root = testpath/"store"
    system bin/"memix", "store", "--store-root", store_root, "ingest",
           "--type", "rules", "--dest", "input.txt", testpath/"input.txt"

    output = shell_output("#{bin}/memix store --store-root #{store_root} list --type rules")
    assert_match "rules", output
    assert_match "input.txt", output
    assert_match "Usage: memix view", shell_output("#{bin}/memix view --help")
    assert_match "Usage: memix tui", shell_output("#{bin}/memix tui --help")
    %w[store view tui].each do |command|
      assert_match "memix #{version}", shell_output("#{bin}/memix #{command} --version")
    end
  end
end
