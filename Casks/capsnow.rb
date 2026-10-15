cask "capsnow" do
  version "1.0.0"
  sha256 "b1af216753fd3a062c895e18c6c00be4c84e973e15ce7fc28308760ab92ec9d9"

  url "https://github.com/fratayaydn/capsnow/releases/download/v#{version}/CapsNow-#{version}.dmg"
  name "CapsNow"
  desc "Turns off the Caps Lock delay"
  homepage "https://github.com/fratayaydn/capsnow"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "CapsNow.app"

  # Upgrades also run this, so it only quits the settings window: the setting must survive an upgrade.
  uninstall quit: "io.github.fratayaydn.capsnow"

  zap launchctl: "io.github.fratayaydn.capsnow.agent",
      trash:     "~/Library/Preferences/io.github.fratayaydn.capsnow.plist"
end
