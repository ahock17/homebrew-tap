cask "plezy" do
  version "2.22.0"
  sha256 "e1802829f4726c48e38f8bd6e77b544eadebe17388f72d0cdd3e34f7ff2d720f"

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
