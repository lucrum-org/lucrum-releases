cask "lucrum-terminal" do
  version "0.1.3"

  on_arm do
    sha256 "0f56dd773643ce0aea7383139061acfe0049e713a0dbd9e9f47c647885b00cc0"
    url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/Lucrum-macOS-aarch64.zip"
  end
  on_intel do
    sha256 "2a5e138c374887217f008c5c59291560880f69d24e984f3a0840c8097ff8e925"
    url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/Lucrum-macOS-x86_64.zip"
  end

  name "Lucrum"
  desc "Terminal that earns while you wait"
  homepage "https://github.com/lucrum-org/lucrum-terminal"

  app "Lucrum.app"

  zap trash: [
    "~/Library/Application Support/Lucrum",
  ]
end
