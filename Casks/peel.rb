cask "peel" do
  version "1.0.0"
  sha256 "74a67e43eca891891ca7dad4febb7e795cb80d78665e1fcf6b4b14df11f39123"

  url "https://github.com/SnackStudio/peel-releases/releases/download/v#{version}/Peel-#{version}.dmg"
  name "Peel"
  desc "Open archives like folders: ZIP, RAR, 7z and TAR"
  homepage "https://www.snackstud.io/peel"

  livecheck do
    url "https://www.snackstud.io/peel/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "Peel.app"

  zap trash: [
    "~/Library/Application Support/Peel",
    "~/Library/Caches/Peel",
    "~/Library/HTTPStorages/io.snackstud.peel",
    "~/Library/Preferences/io.snackstud.peel.plist",
    "~/Library/Services/Peel & Reveal.workflow",
    "~/Library/Services/Peel Here.app",
    "~/Library/Services/Peel to….workflow",
    "~/Library/Services/Peel.workflow",
    "~/Library/Services/peel-here.sh",
  ]
end
