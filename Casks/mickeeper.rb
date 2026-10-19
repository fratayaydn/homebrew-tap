cask "mickeeper" do
  version "1.0.1"
  sha256 "ebbfba124f25ad34aa9ab39bcebae2894be0b58ea1c5de4629cdc5a1b19f0c17"

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
