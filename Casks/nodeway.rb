cask "nodeway" do
  arch arm: "mac", intel: "mac-x64"

  version "0.2.68"
  sha256 arm: "02ac23afd67c8d4291d7f0d7a8cc39cec8c7b8e6e855d85892e2277ce6c818e6", intel: "9c600fc57a102233453c47926882093a980427ef0a4ea2eb44c72efad7b23dee"

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
