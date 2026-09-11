cask "opsmaxx" do
  arch arm: "arm64", intel: "x64"

  version "0.36.7"
  sha256 arm:   "c0371ba873fde07b6ae30515ee9ae02159565bb5a554c7ec3775b26d59a3e39e",
         intel: "51d090a9efc568baa9ae2b3e1097dc5c06fdea04ec6db8ff1ef0bde50aa61a72"

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
