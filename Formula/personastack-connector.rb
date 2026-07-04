class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  version "0.7.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.7.2/personastack-connector_0.7.2_darwin_arm64.tar.gz"
      sha256 "2ca21a36f055da22b1b002da9130324132b4b228199c224eb5fe24ed768b91ac"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.7.2/personastack-connector_0.7.2_darwin_amd64.tar.gz"
      sha256 "9170763626dc111069c415cac22ac4d71510cf526f7dfdad2076770ae4eaaf2c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.7.2/personastack-connector_0.7.2_linux_arm64.tar.gz"
      sha256 "02d2779d57500b28374e04eaebbea53579312e518b5beb934c43a014226dadb9"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.7.2/personastack-connector_0.7.2_linux_amd64.tar.gz"
      sha256 "7d1092be0b45feb0129e1d13f92cb7287f99dcf7ce367bd472f63fc1ff5f13b4"
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
