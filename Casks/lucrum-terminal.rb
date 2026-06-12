cask "lucrum-terminal" do
  version "0.2.0"

  on_arm do
    sha256 "c69b7e213ff56db95b8040b6c1a89954152117dce6fbf59735bf19856586b233"
    url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/Lucrum-macOS-aarch64.zip"
  end
  on_intel do
    sha256 "669a8adc400b2be0556d6cd541731a4af36383684e2d5f34a424c08b59957d03"
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
