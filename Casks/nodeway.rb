cask "nodeway" do
  arch arm: "mac", intel: "mac-x64"

  version "0.2.71"
  sha256 arm: "34459d10f2a2f00e210f9bba99636519e2c1dda6bd64573c53ea3ba3b47f9155", intel: "6cb83bd30991881703a29e08ef39c7712f546fb9a201fd29e67672176c748ec4"

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
