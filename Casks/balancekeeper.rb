cask "balancekeeper" do
  version "1.0.0"
  sha256 "4576f8cf74b78e225042b3babf92948be631a3ff70d9ea177572737bab9daf28"

  url "https://github.com/fratayaydn/balancekeeper/releases/download/v#{version}/BalanceKeeper-#{version}.dmg"
  name "BalanceKeeper"
  desc "Keeps the left/right audio balance from drifting"
  homepage "https://github.com/fratayaydn/balancekeeper"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "BalanceKeeper.app"

  # The background agent restarts itself when the app is replaced, so upgrades only quit the settings window.
  uninstall quit: "io.github.fratayaydn.balancekeeper"

  zap launchctl: "io.github.fratayaydn.balancekeeper.agent",
      trash:     "~/Library/Preferences/io.github.fratayaydn.balancekeeper.plist"
end
