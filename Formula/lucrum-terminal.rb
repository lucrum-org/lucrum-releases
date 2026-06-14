class LucrumTerminal < Formula
  desc "Terminal that earns while you wait"
  homepage "https://github.com/lucrum-org/lucrum-releases"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-aarch64-apple-darwin.tar.gz"
      sha256 "65e93d3d8584d4325ea61b6bb96c3d1767e19fd7cabf3d12e83f3ff4d6d00815"
    end
    on_intel do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-x86_64-apple-darwin.tar.gz"
      sha256 "a160e72d2bdca6153a54a7ca25e4b2bdacf13134901987ac170b2987fb072574"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f89775fbd43bf83f1bf7f74f8074d292037c32c09548e608dc82d0a8d1e6898b"
    end
    on_intel do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d59e3d055bdb74acd1ea9fd432d52f4c734a589dc695581fb3491d8a480e759b"
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
