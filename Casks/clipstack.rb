cask "clipstack" do
  version "1.1.1"
  sha256 "b55649380bb5984b931327badf264d5583b0e953078a7b28791b365888ce2d84"

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
