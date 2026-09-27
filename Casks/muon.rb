cask "muon" do
  version "0.3.4"
  sha256 "40b1de885d9a0c13c83e5cf134935f6a31ddfea3877bd4b88e6ab8fce1940345"

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
