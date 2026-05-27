class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  version "0.5.7"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.7/personastack-connector_0.5.7_darwin_arm64.tar.gz"
      sha256 "9169696c3ea5795fbec0615071c85aa19bb021973e3b335ca957c66105ff3113"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.7/personastack-connector_0.5.7_darwin_amd64.tar.gz"
      sha256 "29c9fd3b5b245ec9a0a3357841322d9ef77bf2b1e742561ab0e40d00e9cbde79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.7/personastack-connector_0.5.7_linux_arm64.tar.gz"
      sha256 "0b0c9acc60582dd6ce523d9bf1a3b7c5d17d16e569728d2db3430c96a0bb54ef"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.7/personastack-connector_0.5.7_linux_amd64.tar.gz"
      sha256 "a9011005d73a84163db11fdaaed82278bab3d531e054fb15f00a710bf66a00b8"
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
