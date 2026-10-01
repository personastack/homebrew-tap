cask "personastack" do
  version "0.2.1"
  sha256 "d39108f96fb9cf915342b63de967a506650900202688b6da4526d7e55e5a4b06"

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
