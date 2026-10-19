cask "fullscreenkeeper" do
  version "1.0.1"
  sha256 "18d0a265f85ba6f1369db0f7f7372961f2e75cca223166b74f6dcead2fa86b25"

  url "https://github.com/fratayaydn/fullscreenkeeper/releases/download/v#{version}/FullscreenKeeper-#{version}.dmg"
  name "FullscreenKeeper"
  desc "Reopens apps in full screen when they were quit in full screen"
  homepage "https://github.com/fratayaydn/fullscreenkeeper"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "FullscreenKeeper.app"

  # The background agent restarts itself when the app is replaced, so upgrades only quit the settings window.
  uninstall quit: "io.github.fratayaydn.fullscreenkeeper"

  zap launchctl: [
        "io.github.fratayaydn.fullscreenkeeper.agent",
        "io.github.fratayaydn.fullscreenkeeper.updater",
      ],
      trash:     "~/Library/Preferences/io.github.fratayaydn.fullscreenkeeper.plist"
end
