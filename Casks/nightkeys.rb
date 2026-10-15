cask "nightkeys" do
  version "1.0.0"
  sha256 "b561fc11f13c697d2f939a46cb9656364f44fa68a8fc6902b905595daccc6821"

  url "https://github.com/fratayaydn/nightkeys/releases/download/v#{version}/NightKeys-#{version}.dmg"
  name "NightKeys"
  desc "Lights the keyboard backlight only when typing on the built-in keyboard"
  homepage "https://github.com/fratayaydn/nightkeys"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "NightKeys.app"

  # The background agent restarts itself when the app is replaced, so upgrades only quit the settings window.
  uninstall quit: "io.github.fratayaydn.nightkeys"

  zap launchctl: "io.github.fratayaydn.nightkeys.agent",
      trash:     "~/Library/Preferences/io.github.fratayaydn.nightkeys.plist"
end
