class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  version "0.7.6"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.7.6/personastack-connector_0.7.6_darwin_arm64.tar.gz"
      sha256 "6ef360b8345b6b6efaf11c23691e44ecb18800aa0e8318bef9365fed50ad95bd"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.7.6/personastack-connector_0.7.6_darwin_amd64.tar.gz"
      sha256 "0cd597a9e626e446f581ddd2d376fac08fad3bb601f39327a5fb7a37ac5dbfb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.7.6/personastack-connector_0.7.6_linux_arm64.tar.gz"
      sha256 "3200622c1feb8a8e917d2cc3b8806774a3413594fa3fbf0ab423650549484a09"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.7.6/personastack-connector_0.7.6_linux_amd64.tar.gz"
      sha256 "c64c83f73108852378870a3c749cd83855b0cb927e1023a4fc13584ca78b7022"
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
