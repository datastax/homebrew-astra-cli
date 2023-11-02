class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  url "https://github.com/datastax/astra-cli/releases/download/0.5/astra-cli-0.5-homebrew.tar.gz"
  sha256 "50ccb07b44551d4e30ff70213c5e491101db568f0aaee746bb50c0f8d13cc406"
  
  license "Apache-2.0"
  
  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"astra"
  end
end
