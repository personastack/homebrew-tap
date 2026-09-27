cask "personastack" do
  version "0.1.47"
  sha256 "a59ffb0d416cb6e7f99d87ea60a3e9be74e37fc26d3e60e6a92334dc6698535d"

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
