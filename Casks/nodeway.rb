cask "nodeway" do
  version "0.2.58"
  sha256 "a824e2035e9712b07aec57fbc40c4896caa3a4a855ae14e13906b5eaf0ed19d1"

  url "https://nodeway.app/download/mac?v=#{version}"
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

