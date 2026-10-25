cask "nightkeys" do
  version "1.0.2"
  sha256 "d4888bc428084fc5da4fa3391052fd0aa5539ff4dbac85698e0e09bf8ba3faa8"

  url "https://github.com/fratayaydn/nightkeys/releases/download/v#{version}/NightKeys-#{version}.dmg"
  name "NightKeys"
  desc "Lights the keyboard backlight only when typing on the built-in keyboard"
  homepage "https://github.com/fratayaydn/nightkeys"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "NightKeys.app"

  # The background agent restarts itself when the app is replaced, so upgrades only quit the settings window.
  uninstall quit: "io.github.fratayaydn.nightkeys"

  zap launchctl: [
        "io.github.fratayaydn.nightkeys.agent",
        "io.github.fratayaydn.nightkeys.updater",
      ],
      trash:     "~/Library/Preferences/io.github.fratayaydn.nightkeys.plist"
end
