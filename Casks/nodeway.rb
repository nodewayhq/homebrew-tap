cask "nodeway" do
  arch arm: "mac", intel: "mac-x64"

  version "0.2.75"
  sha256 arm: "f48898fd4317b489bde196347a199d9b8ae08ac9d09309e669c31c7df41b8eec", intel: "9841469a98de53283cfc1380a0bfa7cd2e96a5d54c190d12968d1f41b79c60fd"

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
