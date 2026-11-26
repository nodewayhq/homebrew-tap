cask "nodeway" do
  arch arm: "mac", intel: "mac-x64"

  version "0.2.70"
  sha256 arm: "65a04703fe2a99a9fc318e04cd3f8c7b0bc405a399b3816ca5095678514a1057", intel: "830b8874b1a453f00fcec275305a6b263e1a034eb7cd8bda47a6c44deea51dab"

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
