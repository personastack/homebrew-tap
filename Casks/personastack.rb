cask "personastack" do
  version "0.8.3"
  sha256 "7e101ea0a4f34224e6b5fef792712516106cd85d6b932b86854ea223ef686382"

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
