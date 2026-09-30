cask "personastack" do
  version "0.1.50"
  sha256 "89c8912f426127f3367014f9ce5c6f9631ed2ffbcfb3eb98243299e69a26d490"

  url "https://raw.githubusercontent.com/personastack/homebrew-tap/desktop-v#{version}/Downloads/PersonaStack-#{version}-unsigned.dmg"
  name "PersonaStack"
  desc "Native macOS client for PersonaStack"
  homepage "https://my.personastack.ai"

  depends_on macos: :sonoma

  app "PersonaStack.app"
  auto_updates true

  caveats <<~EOS
    PersonaStack is unsigned. macOS may require a Gatekeeper override the first time you open it.
  EOS
end
