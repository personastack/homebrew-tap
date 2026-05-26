class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  version "0.5.6"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.6/personastack-connector_0.5.6_darwin_arm64.tar.gz"
      sha256 "746ac357fdf66a31ad49b9c7b570a13d322294f505751d9eda564df0dca48821"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.6/personastack-connector_0.5.6_darwin_amd64.tar.gz"
      sha256 "d9d772db06be998df61ce36732947d905d89a51ad47f4bc4d582f5b998ebaf6a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.6/personastack-connector_0.5.6_linux_arm64.tar.gz"
      sha256 "d0c9f0f30ac0ba2bf14f5d312a802dc91bf0f59d3cae129cdd0b4f4f9928dada"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.5.6/personastack-connector_0.5.6_linux_amd64.tar.gz"
      sha256 "ad153c5a963502bc6dc0ea2462b5344ef73b40c247b04e72b569ee3e3565f899"
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
