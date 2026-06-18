class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  version "0.5.11"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.11/personastack-connector_0.5.11_darwin_arm64.tar.gz"
      sha256 "857fafeb650a0fc230d431036a68f9c2435c5f4ca10d9fa05af6ebdd1b4ea033"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.11/personastack-connector_0.5.11_darwin_amd64.tar.gz"
      sha256 "e4938401dd4116e22bfdb14d7a5dc8a1dba57d817fd0ab8e1324f6669eaf1553"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.11/personastack-connector_0.5.11_linux_arm64.tar.gz"
      sha256 "8e4c71550b112a8ce232dd5d38d17f4aeefe7d79bf17b48ec60423ec99f368ac"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.11/personastack-connector_0.5.11_linux_amd64.tar.gz"
      sha256 "398440106b0f7af7ecbc67c397705a57f6c4e1e43546836b6aef34978415d523"
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
