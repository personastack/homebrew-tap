cask "personastack" do
  version "0.2.4"
  sha256 "19dac4cafeb63552a1d8734199ca35b2cb319803b9c52213871f458ef68a3dbb"

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
