class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  url "https://github.com/datastax/astra-cli/releases/download/0.2/astra-cli-0.2-homebrew.tar.gz"
  sha256 "bbdbfca6d5ebcc8cb1cddb8a3bce41e11c7a18f6620d4bcc9a3e48ad51b1e218"
  license "Apache-2.0"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"astra"
  end
end
