cask "nodeway" do
  arch arm: "mac", intel: "mac-x64"

  version "0.2.74"
  sha256 arm: "1f7002ee8b7fab5042c9d71323c7facb5fdc75305387def54b82204c0d8eb6f0", intel: "e93e3b06a0eb883e78e9a3744da745f5c3d31351aa56541ca1f3af994354df43"

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
