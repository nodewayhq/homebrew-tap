cask "nodeway" do
  arch arm: "mac", intel: "mac-x64"

  version "0.2.72"
  sha256 arm: "5c1648d45303683e6dfb87ef1dd054f5501666439c33a727ed47e611e6013a6c", intel: "0cc06ac592c2c8ef6f63732cb26193a362af9778107535e751f79e3a191d2de4"

  url "https://nodeway.app/download/#{arch}?v=#{version}"
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
  depends_on macos: :ventura

  app "Nodeway.app"

  zap trash: [
    "~/.codebase-atlas",
    "~/Library/Application Support/Nodeway",
    "~/Library/Preferences/com.codebaseatlas.app.plist",
    "~/Library/Saved Application State/com.codebaseatlas.app.savedState",
  ]
end
