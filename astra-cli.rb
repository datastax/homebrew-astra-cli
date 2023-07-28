class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  url "https://github.com/datastax/astra-cli/releases/download/0.4/astra-cli-0.4-homebrew.tar.gz"
  sha256 "407655f6344dce09960a2b723d63f1f084e874df325a5eeaf3bdb1cfd5ce1a13"
  license "Apache-2.0"
  
  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"astra"
  end
end
