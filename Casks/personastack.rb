cask "personastack" do
  version "0.7.1"
  sha256 "33630aae3e6a3627f617584adbe148b86429afb83be12ffc44e4133e1d664cd0"

  url "https://raw.githubusercontent.com/personastack/homebrew-tap/desktop-v#{version}/Downloads/PersonaStack-#{version}-developerid.dmg"
  name "PersonaStack"
  desc "Native macOS client for PersonaStack"
  homepage "https://my.personastack.ai"

  depends_on macos: :sonoma

  pkg "Install PersonaStack.pkg"
  auto_updates true

  uninstall quit: "ai.personastack.desktop",
            script: [{
              executable: "/Applications/PersonaStack.app/Contents/MacOS/PersonaStack",
              args: ["--personastack-unregister-login"],
              sudo: false,
              must_succeed: true,
            }, {
              executable: "/Library/Application Support/PersonaStack/LockedControlInstaller",
              args: ["--remove"],
              sudo: true,
              must_succeed: true,
            }],
            pkgutil: ["ai.personastack.desktop", "ai.personastack.locked-control"]

end
