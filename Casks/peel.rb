cask "peel" do
  version "1.4.0"
  sha256 "c7230543d59e00328316aa5aa31f99015aee66cfe777fb8face7f64fa0b2543f"

  url "https://github.com/SnackStudio/peel-releases/releases/download/v#{version}/Peel-#{version}.pkg"
  name "Peel"
  desc "Open archives like folders: ZIP, RAR, 7z and TAR"
  homepage "https://filesunwrapped.com/"

  livecheck do
    url "https://filesunwrapped.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :ventura

  # The installer package registers Peel and its extensions for the user
  # (docs/installer.md). Command-line installs don't open Peel afterwards.
  pkg "Peel-#{version}.pkg"

  uninstall quit:    "io.snackstud.peel",
            pkgutil: "io.snackstud.peel.pkg",
            delete:  "/Applications/Peel.app"

  zap trash: [
    "~/Library/Application Support/Peel",
    "~/Library/Caches/Peel",
    "~/Library/HTTPStorages/io.snackstud.peel",
    "~/Library/Logs/Peel",
    "~/Library/Preferences/io.snackstud.peel.plist",
    "~/Library/Services/Peel & Reveal.workflow",
    "~/Library/Services/Peel Here.app",
    "~/Library/Services/Peel to….workflow",
    "~/Library/Services/peel-here.sh",
    "~/Library/Services/Peel.workflow",
  ]
end
