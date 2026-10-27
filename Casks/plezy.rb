cask "plezy" do
  version "2.25.0"
  sha256 "74eebe378496d87b6c2d675ebfa8cf399301799445f57f160df0a46a7e54fa9d"

  url "https://github.com/edde746/plezy/releases/download/#{version}/plezy-macos.dmg"
  name "Plezy"
  desc "Plex client"
  homepage "https://github.com/edde746/plezy"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Plezy.app"

  zap trash: [
    "~/Library/Application Support/com.edde746.plezy",
    "~/Library/Caches/com.edde746.plezy",
    "~/Library/Caches/SentryCrash/Plezy",
    "~/Library/HTTPStorages/com.edde746.plezy",
    "~/Library/HTTPStorages/com.edde746.plezy.binarycookies",
    "~/Library/Preferences/com.edde746.plezy.plist",
    "~/Library/WebKit/com.edde746.plezy",
  ]
end
