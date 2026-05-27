class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  version "0.5.8"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.8/personastack-connector_0.5.8_darwin_arm64.tar.gz"
      sha256 "b467bc0a584422cec63b856f9fef4d7a209a973df6dd41aca847c2572b32a236"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.8/personastack-connector_0.5.8_darwin_amd64.tar.gz"
      sha256 "ccb2c87211189e4301f03cb84710975e34f371dfd7077de10e142ad36e97498e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.8/personastack-connector_0.5.8_linux_arm64.tar.gz"
      sha256 "fda662e9afd89ada2d4245cdaf9a142b82e78a716ab6f9afccaba1633d57636e"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.8/personastack-connector_0.5.8_linux_amd64.tar.gz"
      sha256 "6eef806dda41a558548640f98042510370b20d9863813f826957cb4ec1ef6666"
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
