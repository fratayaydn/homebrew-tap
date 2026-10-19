cask "fullscreenkeeper" do
  version "1.0.0"
  sha256 "250f6f01357213ef5366dea2a974ed495e42a1ed48e8401cf2302913751059b9"

  url "https://github.com/fratayaydn/fullscreenkeeper/releases/download/v#{version}/FullscreenKeeper-#{version}.dmg"
  name "FullscreenKeeper"
  desc "Reopens apps in full screen when they were quit in full screen"
  homepage "https://github.com/fratayaydn/fullscreenkeeper"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "FullscreenKeeper.app"

  # The background agent restarts itself when the app is replaced, so upgrades only quit the settings window.
  # The app's own updater stays off for Homebrew installs; brew upgrade handles updates.
  uninstall quit: "io.github.fratayaydn.fullscreenkeeper"

  zap launchctl: [
        "io.github.fratayaydn.fullscreenkeeper.agent",
        "io.github.fratayaydn.fullscreenkeeper.updater",
      ],
      trash:     "~/Library/Preferences/io.github.fratayaydn.fullscreenkeeper.plist"
end
