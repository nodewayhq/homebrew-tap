cask "nodeway" do
  version "0.2.46"
  sha256 "09c8cf995b48b8f890dd0fc54ab3ebbfd81592d6ceae86355176a360c29bfa00"

  url "https://github.com/ameer2468/nodeway-releases/releases/download/v#{version}/Nodeway-#{version}-arm64.dmg"
  name "Nodeway"
  desc "See how any codebase fits together"
  homepage "https://nodeway.app/"

  livecheck do
    url "https://nodeway.app/updates/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Nodeway.app"

  zap trash: [
    "~/.codebase-atlas",
    "~/Library/Application Support/Nodeway",
    "~/Library/Preferences/com.codebaseatlas.app.plist",
    "~/Library/Saved Application State/com.codebaseatlas.app.savedState",
  ]
end
