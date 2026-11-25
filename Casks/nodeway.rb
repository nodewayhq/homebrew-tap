cask "nodeway" do
  arch arm: "mac", intel: "mac-x64"

  version "0.2.69"
  sha256 arm: "1062d5cd8017e449aabb314f465c67fa9e4018163bab2f0d0b7a1ca91ff27ee4", intel: "16779bd5205277142de1ec7e12b01e917d89e64622b657222bfbc000e1161b17"

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
