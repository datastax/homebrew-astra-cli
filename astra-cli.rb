class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  url "https://github.com/datastax/astra-cli/releases/download/0.2.1/astra-cli-0.2.1-homebrew.tar.gz"
  sha256 "3f86d1d405f6310680742015345c1f77f87e77838c2da0614738ac12823988a0"
  license "Apache-2.0"
  
  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"astra"
  end
end
