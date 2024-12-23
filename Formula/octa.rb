class Octa < Formula
  desc "Easy and Faster: The Build Tool That Works for You!"
  homepage "https://github.com/OctaHive/octa#readme"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/OctaHive/octa/releases/download/v0.1.0/octa-Darwin-aarch64.tar.gz"
      sha256 "2cf71ee1cfe8c189fd5b6d68b6f46bf5890c9d8e502cfd4f085bbe2b0ce92743"

      def install
        bin.install "octa"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/OctaHive/octa/releases/download/v0.1.0/octa-Darwin-x86_64.tar.gz"
      sha256 "78f683d700dbd75086973ac9a69a8a821c06c1a27ba8cc6d6ecaf40102226199"

      def install
        bin.install "octa"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/OctaHive/octa/releases/download/v0.1.0/octa-Linux-amd64.tar.gz"
      sha256 "fe097d7092afb84b319e7608ceb8d7280e1315837f38777ad763c8f234e61741"

      def install
        bin.install "octa"
      end
    end
  end

  test do
    assert_match "octa 0.1.0", shell_output("#{bin}/octa --version")
  end
end
