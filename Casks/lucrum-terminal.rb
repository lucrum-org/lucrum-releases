cask "lucrum-terminal" do
  version "0.3.0"

  on_arm do
    sha256 "3d626eb4acf2c27300491deb50549be6b38af4f6829c2c8e943e320f86813263"
    url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/Lucrum-macOS-aarch64.zip"
  end
  on_intel do
    sha256 "d2e0e096100bbaeeb4f54e8333bc21cb6651101a775e817ce9f50a7f8d237945"
    url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/Lucrum-macOS-x86_64.zip"
  end

  name "Lucrum"
  desc "Terminal that earns while you wait"
  homepage "https://github.com/lucrum-org/lucrum-releases"

  app "Lucrum.app"

  zap trash: [
    "~/Library/Application Support/Lucrum",
  ]
end
