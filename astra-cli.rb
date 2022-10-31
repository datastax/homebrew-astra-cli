class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  url "https://github.com/datastax/astra-cli/releases/download/0.1/astra-cli-0.1-mac.tar.gz"
  sha256 "a5ded836246cf775ab4068b79528b60c245f2f2a57d451f6dfe97b6b05622a64"
  license "Apache-2.0"

  #depends_on "openjdk@11" # For DsBulk and PulsarShell
  #depends_on "python@3.10" # For CqlShell

  #bottle do
  #  sha256 cellar: :any_skip_relocation, ventura: "98656a29e9c0282deb6f7e12b8f863453ad3c63d9149333042ce953f19944aa2"
  #end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"astra"
  end
end
