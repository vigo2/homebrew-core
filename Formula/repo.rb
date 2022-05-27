class Repo < Formula
  include Language::Python::Shebang

  desc "Repository tool for Android development"
  homepage "https://source.android.com/source/developing.html"
  url "https://gerrit.googlesource.com/git-repo.git",
      tag:      "v2.26",
      revision: "bdcba7dc36f1c8e6041681eb5b3b5229c93c7c5c"
  license "Apache-2.0"
  version_scheme 1

  bottle do
    sha256 cellar: :any_skip_relocation, all: "79c25299915ae2ceb08ef1eb424cfa0811a597a04809936fc4f43644260de409"
  end

  depends_on "python@3.10"

  def install
    bin.install "repo"
    rewrite_shebang detected_python_shebang, bin/"repo"

    doc.install (buildpath/"docs").children
  end

  test do
    assert_match "usage:", shell_output("#{bin}/repo help 2>&1")
  end
end
