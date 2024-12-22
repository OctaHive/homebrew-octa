class Octa < Formula
  desc "Easy and Faster: The Build Tool That Works for You!"
  homepage "https://github.com/OctaHive/octa#readme"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/OctaHive/octa/releases/download/v0.1.0/octa-Darwin-aarch64.tar.gz"
      sha256 "3e2274a1e11661634fe13fee6c99b59be908944e594375b7e0e4691001b33b42"

      def install
        bin.install "octa"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/OctaHive/octa/releases/download/v0.1.0/octa-Darwin-x86_64.tar.gz"
      sha256 "430268defa7b156618ed7f82538ff2c671ded5dff3f72fd6fd2e80c5e5392dff"

      def install
        bin.install "octa"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/OctaHive/octa/releases/download/v0.1.0/octa-Linux-amd64.tar.gz"
      sha256 "4f7b4825c0f372feeeafb00af99ef57da70ad4f4aea954208626ce692c5b523a"

      def install
        bin.install "octa"
      end
    end
  end

  test do
    assert_match "octa 0.1.0", shell_output("#{bin}/octa --version")
  end
end
