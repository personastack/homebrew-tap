cask "personastack" do
  version "0.9.0"
  sha256 "de7e6489d1958a0e20403522ef837c4cf31577074b8d4bf54aaebf815bbe747f"

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
