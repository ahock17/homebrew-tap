cask "plezy" do
  version "2.23.0"
  sha256 "eacdcf659e236c3e28558fca912b23e070486e5f6fc44789f28ea049b5e88e94"

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
