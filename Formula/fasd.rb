class Fasd < Formula
  desc "CLI tool for quick access to files and directories"
  homepage "https://github.com/whjvenyl/fasd"
  url "https://github.com/whjvenyl/fasd/archive/refs/tags/1.0.2.tar.gz"
  sha256 "6e048cfbfe53bf8b806e36db17c4eb2b8e15e8dfaadc759c7ce78e3915716b21"
  license "MIT"
  head "https://github.com/whjvenyl/fasd", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "9241df0f32971ce5a84c977f6908b93114946843813d5375ba7b983a7a783188"
  end

  def install
    bin.install "fasd"
    man1.install "fasd.1"
  end

  test do
    system "#{bin}/fasd", "--init", "auto"
  end
end
