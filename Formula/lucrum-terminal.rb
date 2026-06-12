class LucrumTerminal < Formula
  desc "Terminal that earns while you wait"
  homepage "https://github.com/lucrum-org/lucrum-terminal"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-aarch64-apple-darwin.tar.gz"
      sha256 "64fb28525296f2223b767db22ef9c697a6db6a7ba59a9a12aae24d1158014775"
    end
    on_intel do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-x86_64-apple-darwin.tar.gz"
      sha256 "cb97f1b839e88c04742d8489d1c0219a1a9c678c88c3acaa2d011f6f2403762b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a408d7132b6a2e3366ab84967102aac643810c60bf8fae5a0d3fb1d37a26f902"
    end
    on_intel do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c722687380129ceb131c656d62798f511586d1f991a1e990b93a22ec11c22a0d"
    end
  end

  def install
    if File.exist? "dist-lucrum"
      bin.install "dist-lucrum" => "lucrum"
    else
      bin.install "lucrum"
    end
  end

  test do
    assert_predicate bin/"lucrum", :executable?
  end
end
