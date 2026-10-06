cask "personastack" do
  version "0.8.0"
  sha256 "95cc95087a5c23d743935465c4a38d94eb78f3436d9545581359af708d17aad0"

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
              executable: "/bin/sh",
              args: ["-c", 'if [ -e "/Library/Application Support/PersonaStack/LockedControlInstaller" ]; then exec "/Library/Application Support/PersonaStack/LockedControlInstaller" --remove; elif [ -e "/Library/Security/SecurityAgentPlugins/PersonaStackLockedGrantCandidate.bundle" ]; then echo "Legacy locked-control cleanup requires its signed removal utility." >&2; exit 1; fi'],
              sudo: true,
              must_succeed: true,
            }],
            pkgutil: ["ai.personastack.desktop", "ai.personastack.locked-control"]

end
