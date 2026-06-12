class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  version "0.5.10"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.10/personastack-connector_0.5.10_darwin_arm64.tar.gz"
      sha256 "5891ab365e9140bdee946bfd1c99d75483ae54c5095a1000484b0a93289599d3"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.10/personastack-connector_0.5.10_darwin_amd64.tar.gz"
      sha256 "9a46e95f07ffe109c2c1411711c8f7013fa1efda9232d2384e4da79b0a77f832"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.10/personastack-connector_0.5.10_linux_arm64.tar.gz"
      sha256 "fc74bef5638b178a819b02feafd3dc5b4dddf65fd312c210029a935dde06c602"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.10/personastack-connector_0.5.10_linux_amd64.tar.gz"
      sha256 "a2f13406e36824254806e580042cf99de26fbdfc3863b8ef0284cf344194ca37"
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
