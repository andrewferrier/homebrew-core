class Fasd < Formula
  desc "CLI tool for quick access to files and directories"
  homepage "https://github.com/clvv/fasd"
  url "https://github.com/whjvenyl/fasd/releases/download/1.0.2/fasd-1.0.2.zip"
  sha256 "3ab3f751f812ea3acd26545cd62f522e600a289bfac51e82337ce3684ba137bd"
  license "MIT"
  head "https://github.com/clvv/fasd.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "9241df0f32971ce5a84c977f6908b93114946843813d5375ba7b983a7a783188"
  end

  deprecate! date: "2022-06-16", because: :repo_archived

  def install
    bin.install "fasd"
    man1.install "fasd.1"
  end

  test do
    system "#{bin}/fasd", "--init", "auto"
  end
end
