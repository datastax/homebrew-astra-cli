class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  url "https://github.com/datastax/astra-cli/releases/download/0.1/astra-cli-0.1-mac.tar.gz"
  sha256 "5bfbcc258de51859f19b6dc82cb54e01136c2bb3ec1b30a7fb59f426fda27d81"
  license "Apache-2.0"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/astra"
  end
end
