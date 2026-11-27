cask "nodeway" do
  arch arm: "mac", intel: "mac-x64"

  version "0.2.73"
  sha256 arm: "547cc3594d4adac4ac4672be5454eb62bc1efb45647fc0cda0fc3bd885dfa661", intel: "39edccfb9ef65c64c4b3d99790bd0e445eb586c46f7301ccda6391ac3f3de108"

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
