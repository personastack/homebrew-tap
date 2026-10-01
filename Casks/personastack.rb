cask "personastack" do
  version "0.3.3"
  sha256 "b2d07283fa31b8cce373ede79f24fd1e6044eb58a5d6b93368a19458a8fa02e8"

  url "https://raw.githubusercontent.com/personastack/homebrew-tap/desktop-v#{version}/Downloads/PersonaStack-#{version}-selfsigned.dmg"
  name "PersonaStack"
  desc "Native macOS client for PersonaStack"
  homepage "https://my.personastack.ai"

  depends_on macos: :sonoma

  app "PersonaStack.app"
  auto_updates true

  caveats <<~EOS
    PersonaStack uses a persistent self-signed certificate. It is not Developer ID signed or notarized.
    macOS may require a Gatekeeper override the first time you open it.
  EOS
end
