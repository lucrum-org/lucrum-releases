class LucrumTerminal < Formula
  desc "Terminal that earns while you wait"
  homepage "https://github.com/lucrum-org/lucrum-releases"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-aarch64-apple-darwin.tar.gz"
      sha256 "39f34c10b2a08438f604a384f155d187644524d42b1023dc909d8fdb4ac8521f"
    end
    on_intel do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-x86_64-apple-darwin.tar.gz"
      sha256 "a61fe0c59c99a4a51b28f177d9361892720ef5401a64b766de9b5758c94808b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "668c2bfc3eafeac3a866edf676c8dbe0555cbff825f86542b4628df5f1699baa"
    end
    on_intel do
      url "https://github.com/lucrum-org/lucrum-releases/releases/download/v#{version}/lucrum-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d396490241a9db6971549ede5fb841bcd2470f0f8f2f6a80080206c128107f63"
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
