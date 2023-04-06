class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  #url "https://github.com/datastax/astra-cli/releases/download/0.2.1/astra-cli-0.2.1-homebrew.tar.gz"
  #sha256 "47d626ae9bd111ce3cd046184d7573527b8811e848870a123219553c02a814b2"
  url "https://github.com/datastax/astra-cli/releases/download/0.3/astra-cli-0.3-homebrew.tar.gz"
  sha256 "c8806dbb440ed9df57a0faa5d3e66cb252a978d7657a97a84b58bb8353b2e55a"
  license "Apache-2.0"
  
  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"astra"
  end
end
