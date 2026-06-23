class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  version "0.5.12"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.12/personastack-connector_0.5.12_darwin_arm64.tar.gz"
      sha256 "f2e55919d9d9a724c38b6c32cb800e59266aecc9a1bd97cc57d3c57416ed49b4"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.12/personastack-connector_0.5.12_darwin_amd64.tar.gz"
      sha256 "96930928f1c511fa15d76957dde82eaeb7e8b9452523520d8f5cf4a5f888ea6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.12/personastack-connector_0.5.12_linux_arm64.tar.gz"
      sha256 "06ef3066bc334400e38cf28360efac3592ee9862760a29f0f89c0eea430017d9"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.12/personastack-connector_0.5.12_linux_amd64.tar.gz"
      sha256 "8ff4d1a185444b187e121cdf528d5e5b43089ecb51e0df5c5bbb6dcefbd30915"
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
