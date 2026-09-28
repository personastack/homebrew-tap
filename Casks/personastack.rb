cask "personastack" do
  version "0.1.48"
  sha256 "89435b19eedaa13099c911fee8e4939eb0d5217e112b4502bb638e00d4c5325f"

  url "https://raw.githubusercontent.com/personastack/homebrew-tap/desktop-v#{version}/Downloads/PersonaStack-#{version}-unsigned.dmg"
  name "PersonaStack"
  desc "Native macOS client for PersonaStack"
  homepage "https://my.personastack.ai"

  depends_on macos: :sonoma

  app "PersonaStack.app"

  caveats <<~EOS
    PersonaStack is unsigned. macOS may require a Gatekeeper override the first time you open it.
  EOS
end
