class LucrumTerminal < Formula
  desc "Terminal that earns while you wait"
  homepage "https://github.com/lucrum-org/lucrum-terminal"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-aarch64-apple-darwin.tar.gz"
      sha256 "58a480bec551d475ad759271fb7a90888bda77085ae56cac5e987aa58ec626b6"
    end
    on_intel do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-x86_64-apple-darwin.tar.gz"
      sha256 "084a0b69170c12827d81c43bbd4ea6e7fa218c3e34d1075323f136b50a51094d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "73b3030f08efd249977822086b9c2d971b04df9c2ba64993b1d4271133b87440"
    end
    on_intel do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82448abafc980013831031d8c4efa37bbdefa17c3be6fcef5f5e174b5fb6782e"
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
