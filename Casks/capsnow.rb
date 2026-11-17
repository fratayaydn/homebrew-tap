cask "capsnow" do
  version "1.0.1"
  sha256 "7a8f20d075105839beb26bbd1fd40e39b88c5eb54dc3015dda8476f78c8204e3"

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
