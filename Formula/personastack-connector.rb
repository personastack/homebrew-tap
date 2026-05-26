class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  version "0.5.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.1/personastack-connector_0.5.1_darwin_arm64.tar.gz"
      sha256 "51e736e3712f0a9c76de9546a1fa03c337af5fb3b22d7de461814962932adde3"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.1/personastack-connector_0.5.1_darwin_amd64.tar.gz"
      sha256 "8657f9702e067c629d94db755330bb2270ce35ae125d34c9c83a47e0b31bbad1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.1/personastack-connector_0.5.1_linux_arm64.tar.gz"
      sha256 "3926f4ea60f0df088a7f3a5bc7df348e073d5082085ec7479554fa0f7c8a1d40"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.1/personastack-connector_0.5.1_linux_amd64.tar.gz"
      sha256 "16bd3f2d2b04a0d2dbf00d0d3d72f52c133c57d42367ad3314f62e232f92f44c"
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
