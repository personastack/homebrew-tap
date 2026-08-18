class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  version "0.8.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.8.0/personastack-connector_0.8.0_darwin_arm64.tar.gz"
      sha256 "137816a9aa20d436ce1832e14c8cd914978114c8c0b841bc2deecdb7d17c6094"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.8.0/personastack-connector_0.8.0_darwin_amd64.tar.gz"
      sha256 "e55a7ed3ef345e90ad78fb2a0b2d625a41f34784cc5b33571503cdee5822d995"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.8.0/personastack-connector_0.8.0_linux_arm64.tar.gz"
      sha256 "536b1fc9141a9aa515a65085053275f65a2e511e80d9ae20fed6550f6c8bb870"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.8.0/personastack-connector_0.8.0_linux_amd64.tar.gz"
      sha256 "0b4c481de56e88737b1cb350a3cbf554a289932f40b0bcace0d518427cbf8d53"
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
