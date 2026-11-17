cask "mickeeper" do
  version "1.0.2"
  sha256 "333a19b5efd79055fd877da3e9b808c0a0d68ac09bec2b662a855310fbb8972c"

  url "https://github.com/fratayaydn/mickeeper/releases/download/v#{version}/MicKeeper-#{version}.dmg"
  name "MicKeeper"
  desc "Keeps AirPods and iPhones off the microphone and locks the input level"
  homepage "https://github.com/fratayaydn/mickeeper"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "MicKeeper.app"

  # The background agent restarts itself when the app is replaced, so upgrades only quit the settings window.
  uninstall quit: "io.github.fratayaydn.mickeeper"

  zap launchctl: [
        "io.github.fratayaydn.mickeeper.agent",
        "io.github.fratayaydn.mickeeper.updater",
      ],
      trash:     "~/Library/Preferences/io.github.fratayaydn.mickeeper.plist"
end
