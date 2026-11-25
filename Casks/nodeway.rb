cask "nodeway" do
  arch arm: "mac", intel: "mac-x64"

  version "0.2.66"
  sha256 arm: "a53a40a66c60f33d0dafabaf1c1f3aa308e158d88f0d25d05ee03d56af7e5fcf", intel: "7cc69686fd6b0a009b3be977c969ef9045cc87f3727f0a5b0bf8e1490701a27a"

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
