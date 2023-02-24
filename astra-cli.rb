class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  url "https://github.com/datastax/astra-cli/releases/download/0.2.1/astra-cli-0.2.1-homebrew.tar.gz"
  sha256 "47d626ae9bd111ce3cd046184d7573527b8811e848870a123219553c02a814b2"
  license "Apache-2.0"
  
  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"astra"
  end
end
