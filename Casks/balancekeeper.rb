cask "balancekeeper" do
  version "1.0.2"
  sha256 "29981e2874f24a27a7ed89d5bd9a90012782726303ccd2c2de891dfa4daf6e7a"

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
