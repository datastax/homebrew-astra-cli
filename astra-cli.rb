class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  url "https://github.com/datastax/astra-cli/releases/download/0.2.1/astra-cli-0.2.1-homebrew.tar.gz"
  sha256 "9bf0debc56beb9c75df9e7b9d4404dabf9ec3aee617e20acbda8338361db1830"
  license "Apache-2.0"
  
  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"astra"
  end
end
