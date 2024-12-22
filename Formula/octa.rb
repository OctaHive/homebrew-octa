class Octa < Formula
  desc "Easy and Faster: The Build Tool That Works for You!"
  homepage "https://github.com/OctaHive/octa#readme"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/OctaHive/octa/releases/download/v0.1.0/octa-Darwin-aarch64.tar.gz"
      sha256 "7648684842fa01a4a9eb77b5b11ed81fc2c5f9f9659b8d9be4c9ba6b10ba3efd"

      def install
        bin.install "octa"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/OctaHive/octa/releases/download/v0.1.0/octa-Darwin-x86_64.tar.gz"
      sha256 "1b505fbc61c202a9fc4594a7245ebbf386aab22277f7ab7f46071229ef653a9e"

      def install
        bin.install "octa"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/OctaHive/octa/releases/download/v0.1.0/octa-Linux-amd64.tar.gz"
      sha256 "276d774d206c79424daa4bb0b768daf5593f5cc12d579469b3244c90cdab60f3"

      def install
        bin.install "octa"
      end
    end
  end

  test do
    assert_match "octa 0.1.0", shell_output("#{bin}/octa --version")
  end
end
