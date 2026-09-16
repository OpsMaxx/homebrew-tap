cask "opsmaxx" do
  arch arm: "arm64", intel: "x64"

  version "0.47.0"
  sha256 arm:   "cfd59dc35492bfb4073d3670ba4c0f7689adaa37b389b0a83f49beb9e58cd9ee",
         intel: "4cbddf52a26d87c32d853b08c9543d11a28ab4eebf8649bdce43ffd3a8617340"

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
