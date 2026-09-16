cask "personastack" do
  version "0.1.10"
  sha256 "b971e15d297ba7bb820e1bf44975bdb64adaffa9e24987ae5181c63b6c8d8ff1"

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
