cask "clipstack" do
  version "1.1.0"
  sha256 "afbd01419a5d23b5e865444273938ade3e1391d00f5d659fdb2c629e06a61b04"

  url "https://github.com/neul-lov/ClipStack/releases/download/v#{version}/ClipStack.dmg"
  name "ClipStack"
  desc "Menu bar clipboard history with ordered multi-copy"
  homepage "https://github.com/neul-lov/ClipStack"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "ClipStack.app"

  zap trash: [
    "~/Library/Application Support/ClipStack",
    "~/Library/Preferences/com.kain.clipstack.plist",
  ]

  caveats <<~EOS
    ClipStack is not notarized yet. If macOS blocks it on first launch, run:
      xattr -dr com.apple.quarantine #{appdir}/ClipStack.app
  EOS
end
