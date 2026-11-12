cask "nodeway" do
  version "0.2.25"
  sha256 "6d0c4cdac56a283bcebbd512058cdf8fcce0058ef846607204b0e22be0fb152b"

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

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Nodeway.app"]
  end

  zap trash: [
    "~/.codebase-atlas",
    "~/Library/Application Support/Nodeway",
    "~/Library/Preferences/com.codebaseatlas.app.plist",
    "~/Library/Saved Application State/com.codebaseatlas.app.savedState",
  ]
end
