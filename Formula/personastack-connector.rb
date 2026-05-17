class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  version "0.1.8"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.1.8/personastack-connector_0.1.8_darwin_arm64.tar.gz"
      sha256 "f1a5e57bb1bbd6f4083d1372028f8c5951c5ed37cd7e33c691b09e6fe060e48b"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.1.8/personastack-connector_0.1.8_darwin_amd64.tar.gz"
      sha256 "4aaa39e6b107482da260bf00f65ce911fb8c83ee36ad20b8e6fd83eaa3a61372"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/personastack/personastack-connector/releases/download/v0.1.8/personastack-connector_0.1.8_linux_arm64.tar.gz"
      sha256 "de66888d8e8a83cf04700b4b4a4c77d65f919262d7139c91407c50be9629fac4"
    else
      url "https://github.com/personastack/personastack-connector/releases/download/v0.1.8/personastack-connector_0.1.8_linux_amd64.tar.gz"
      sha256 "e76a7a732db229d1bda630bd263616e15bc875c5b7350ea5ce29524e9c5a24b7"
    end
  end

  def install
    bin.install "personastack-connector"
  end

  test do
    assert_match "personastack-connector version=", shell_output("#{bin}/personastack-connector version")
  end
end
