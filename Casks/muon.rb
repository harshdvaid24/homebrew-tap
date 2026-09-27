cask "muon" do
  version "0.3.2"
  sha256 "99acebe71ca03dcea36937e14a1daff959c474d0c6cdd46b5b5bf075f05af336"

  url "https://github.com/harshdvaid24/muon/releases/download/v#{version}/Muon.zip"
  name "Muon"
  desc "Local AI for your Mac: writing help, error explanations, document and screenshot answers, voice, meeting notes"
  homepage "https://harshdvaid24.github.io/muon/"

  depends_on arch: :arm64
  depends_on formula: "node"
  depends_on macos: :tahoe

  app "Muon.app"

  zap trash: [
    "~/Library/Application Support/Muon",
    "~/Library/Preferences/com.harshvaid.Muon.plist",
  ]

  caveats <<~EOS
    Muon is not notarized yet. If macOS blocks it on first launch, open
    System Settings > Privacy & Security and click "Open Anyway", or run:
      xattr -dr com.apple.quarantine #{appdir}/Muon.app
  EOS
end
