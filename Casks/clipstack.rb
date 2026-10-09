cask "clipstack" do
  version "1.0.0"
  sha256 "672aa8d1ecbd2b138a78acf5f7adf3a999863017933402b680119cd2b04589d8"

  url "https://github.com/neul-lov/ClipStack/releases/download/v#{version}/ClipStack.dmg"
  name "ClipStack"
  desc "Menu bar clipboard history with ordered multi-copy"
  homepage "https://github.com/neul-lov/ClipStack"

  depends_on macos: ">= :sonoma"
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
