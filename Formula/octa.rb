class Octa < Formula
  desc "Easy and Faster: The Build Tool That Works for You!"
  homepage "https://github.com/OctaHive/octa#readme"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/OctaHive/octa/releases/download/v0.2.0/octa-Darwin-aarch64.tar.gz"
      sha256 "2f022c720f14f5049efbef309c776974c3c89d93d489bfaaf1e040018ebfa651"

      def install
        libexec.install "octa"

        plugins_dir = lib/"octa/plugins"
        plugins_dir.mkpath

        plugins_dir.install "./plugins/octa_plugin_shell"
        plugins_dir.install "./plugins/octa_plugin_tpl"

        (bin/"octa").write_env_script libexec/"octa",
          OCTA_PLUGINS_DIR: "#{HOMEBREW_PREFIX}/lib/octa/plugins"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/OctaHive/octa/releases/download/v0.2.0/octa-Darwin-x86_64.tar.gz"
      sha256 "0689416c054978486f63e5e62d85a5c72949b90810ef57ab65ea79391e2bac59"

      def install
        libexec.install "octa"

        plugins_dir = lib/"octa/plugins"
        plugins_dir.mkpath

        plugins_dir.install "./plugins/octa_plugin_shell"
        plugins_dir.install "./plugins/octa_plugin_tpl"

        (bin/"octa").write_env_script libexec/"octa",
          OCTA_PLUGINS_DIR: "#{HOMEBREW_PREFIX}/lib/octa/plugins"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/OctaHive/octa/releases/download/v0.2.0/octa-Linux-amd64.tar.gz"
      sha256 "fe4e0b660cdc77fe29ba2f0996c314a8de1fbd5311f7aaeb93a387de12c21ec8"

      def install
        libexec.install "octa"

        plugins_dir = lib/"octa/plugins"
        plugins_dir.mkpath

        plugins_dir.install "./plugins/octa_plugin_shell"
        plugins_dir.install "./plugins/octa_plugin_tpl"

        (bin/"octa").write_env_script libexec/"octa",
          OCTA_PLUGINS_DIR: "#{HOMEBREW_PREFIX}/lib/octa/plugins"
      end
    end
  end

  test do
    assert_match "octa 0.2.0", shell_output("#{bin}/octa --version")
  end
end
