cask "personastack" do
  version "0.4.0"
  sha256 "9170687fbfccb9c84c872d68f8c95aae5b908c35495ff8ac000081bee6743215"

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
