require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.131.tgz"
  sha256 "293b2ee4286d903b32a35b10861cbfba3188b4f8f9a8a703a0df35b29c37f043"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "00dc2c62a1c714782be82a18160908c83521ede4e1f18b844026fe50554c2f43"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
