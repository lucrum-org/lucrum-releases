cask "lucrum-terminal" do
  version "0.1.2"

  on_arm do
    sha256 "a2615d5effecefbc945a6561d701506c0b7181e6fc3a57fc5f46c9f9525d53f2"
    url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/Lucrum-macOS-aarch64.zip"
  end
  on_intel do
    sha256 "7a9b1b1b65262ffd0d926c21e6f002955c8b0597809516943556cbe8db403dcd"
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
