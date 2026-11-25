cask "fullscreenkeeper" do
  version "1.0.5"
  sha256 "6211cbe755c8dbce23dc1ba446bbb41878d5809d9b2a29a89e1952b11c7967a1"

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
