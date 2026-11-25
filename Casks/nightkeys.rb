cask "nightkeys" do
  version "1.0.5"
  sha256 "ebb629f7b9880a61b017c5a7de8c3b12867c60fcfb9ba42988ac5fc76976f03d"

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
