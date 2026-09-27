cask "muon" do
  version "0.1.0"
  sha256 "28b5c0cb8596851f9384a0aa5bc2f154b32fafa1dfff371f0acc4036668a1c10"

  url "https://github.com/harshdvaid24/muon/releases/download/v#{version}/Muon.zip"
  name "Muon"
  desc "Local, on-device AI agent that finds, cleans up, opens and builds"
  homepage "https://harshdvaid24.github.io/muon/"

  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"
  depends_on formula: "node"

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
