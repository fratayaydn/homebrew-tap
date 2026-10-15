cask "mickeeper" do
  version "1.0.0"
  sha256 "a82e88e1eaf430cf14f98c6924b86b87c8151ae13f768efd4f0da19a139f400e"

  url "https://github.com/fratayaydn/mickeeper/releases/download/v#{version}/MicKeeper-#{version}.dmg"
  name "MicKeeper"
  desc "Keeps AirPods and iPhones off the microphone and locks the input level"
  homepage "https://github.com/fratayaydn/mickeeper"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "MicKeeper.app"

  # The background agent restarts itself when the app is replaced, so upgrades only quit the settings window.
  uninstall quit: "io.github.fratayaydn.mickeeper"

  zap launchctl: "io.github.fratayaydn.mickeeper.agent",
      trash:     "~/Library/Preferences/io.github.fratayaydn.mickeeper.plist"
end
