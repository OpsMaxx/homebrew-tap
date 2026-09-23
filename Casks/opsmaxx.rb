cask "opsmaxx" do
  arch arm: "arm64", intel: "x64"

  version "0.51.0"
  sha256 arm:   "8f048fcdd416d7fe14ae665a1c16b5bbae341cc0608f40b0cb32e519f0633e4d",
         intel: "93ac939e1e9aa1e3094f4c057849b67f1c13966fb47d2c6b1af54ab34d438c40"

  url "https://github.com/OpsMaxx/OpsMaxx/releases/download/v#{version}/OpsMaxx-#{version}-#{arch}.dmg"
  name "OpsMaxx"
  desc "SSH client, SFTP browser, database manager, secrets vault and MCP gateway"
  homepage "https://opsmaxx.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The build is ad-hoc signed rather than notarized, so Gatekeeper would
  # refuse it on first launch. Clearing the quarantine flag at install time is
  # what every unsigned cask does, and it is the same thing the app's own
  # instructions ask the user to do by hand.
  auto_updates false
  depends_on macos: :big_sur

  app "OpsMaxx.app"

  zap trash: [
    "~/Library/Application Support/OpsMaxx",
    "~/Library/Preferences/com.opsmaxx.app.plist",
    "~/Library/Saved Application State/com.opsmaxx.app.savedState",
    "~/Library/Logs/OpsMaxx",
  ]
end
