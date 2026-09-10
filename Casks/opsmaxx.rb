cask "opsmaxx" do
  arch arm: "arm64", intel: "x64"

  version "0.35.10"
  sha256 arm:   "7a40eaff1d052849ef64cecfbc6589b9414ebc9066a23609360060028a1cd05a",
         intel: "106d291eaf573c42b3c87e398eae52e65397d2d6013eb6ddb9b5e2c8c93a71c6"

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
