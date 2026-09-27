cask "muon" do
  version "0.3.3"
  sha256 "14867832f237b7b10e2083a9a18fcdf40c636193512ab491e48127fda4928780"

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
