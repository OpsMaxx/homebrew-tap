cask "opsmaxx" do
  arch arm: "arm64", intel: "x64"

  version "0.35.16"
  sha256 arm:   "ba29da81c30c795ed6b56c88c79815db3f76c5cdf4c1f3a3883c0fe0e5acd495",
         intel: "7134c36285a62f3a8f2e6e2d4948127cae6763db8d86e6d1be7e55f1814eda93"

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
