class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  url "https://github.com/datastax/astra-cli/releases/download/0.2.1/astra-cli-0.2.1-homebrew.tar.gz"
  sha256 "d933b0a62dad399b0856c8e93cfec8cc8a60d0423e4240785882a62cce9b90dc"
  license "Apache-2.0"
  
  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"astra"
  end
end
