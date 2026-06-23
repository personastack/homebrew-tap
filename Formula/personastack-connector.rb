class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  version "0.6.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.6.0/personastack-connector_0.6.0_darwin_arm64.tar.gz"
      sha256 "a54aad894d4032e893fd6c44a09bea2426e79e83d0f8575fe9b236375edc7bcc"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.6.0/personastack-connector_0.6.0_darwin_amd64.tar.gz"
      sha256 "40e8354b5ee1085198113c5db6d44d802584b15ac8311eca8cad5375d0b2549f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.6.0/personastack-connector_0.6.0_linux_arm64.tar.gz"
      sha256 "5df781de07a6e00af56c978766398aba1d8005253e58fd4b08f8fd3fb89d19ea"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.6.0/personastack-connector_0.6.0_linux_amd64.tar.gz"
      sha256 "e80ee531b7b63c17ae985b4f1da6f5171cf5233501576aa0e6618875872fe2ad"
    end
  end

  def install
    bin.install "personastack-connector"
  end

  def caveats
    <<~EOS
      Before brew remove, run:
        #{opt_bin}/personastack-connector service uninstall --service-scope user

      macOS system-scope uninstall/removal requires sudo:
        sudo #{opt_bin}/personastack-connector service uninstall --service-scope system
    EOS
  end

  test do
    assert_match "personastack-connector version=", shell_output("#{bin}/personastack-connector version")
  end
end
