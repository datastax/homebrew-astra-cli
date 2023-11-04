class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  url "https://github.com/datastax/astra-cli.git",
      tag:      "0.5",
      revision: "1be2c741ad49f87375f907f4a289a671b48af942"
  license "Apache-2.0"
  head "https://github.com/datastax/astra-cli.git", branch: "main"

bottle do
    root_url "https://github.com/datastax/astra-cli/releases/download/0.5"
    #sha256 cellar: :any_skip_relocation, arm64_sonoma:   "ea59f6febdef21fc385c18b43e19b5805c74a40f3057dc0dc46162879f7c1242"
    #sha256 cellar: :any_skip_relocation, arm64_ventura:  "d384eac5db501bffc4ca293814999bd211a30aa8d8c51608264c141ecae0e588"
    #sha256 cellar: :any_skip_relocation, arm64_monterey: "76a10d22e284b7082d386b7850b228ba8c7b8a39e0af5fe8dd3bfda8ee5e8504"
    #sha256 cellar: :any_skip_relocation, arm64_big_sur:  "748bce503189849012269695eaa9da403d63944d480b5f65912efd30abe75937"
    sha256 cellar: :any_skip_relocation, sonoma:         "50ccb07b44551d4e30ff70213c5e491101db568f0aaee746bb50c0f8d13cc406"
    sha256 cellar: :any_skip_relocation, ventura:        "50ccb07b44551d4e30ff70213c5e491101db568f0aaee746bb50c0f8d13cc406"
    sha256 cellar: :any_skip_relocation, monterey:       "50ccb07b44551d4e30ff70213c5e491101db568f0aaee746bb50c0f8d13cc406"
    sha256 cellar: :any_skip_relocation, big_sur:        "50ccb07b44551d4e30ff70213c5e491101db568f0aaee746bb50c0f8d13cc406"
    sha256 cellar: :any_skip_relocation, catalina:       "50ccb07b44551d4e30ff70213c5e491101db568f0aaee746bb50c0f8d13cc406"
    sha256 cellar: :any_skip_relocation, mojave:         "50ccb07b44551d4e30ff70213c5e491101db568f0aaee746bb50c0f8d13cc406"
    sha256 cellar: :any_skip_relocation, high_sierra:    "50ccb07b44551d4e30ff70213c5e491101db568f0aaee746bb50c0f8d13cc406"
    sha256 cellar: :any_skip_relocation, sierra:         "50ccb07b44551d4e30ff70213c5e491101db568f0aaee746bb50c0f8d13cc406"
    sha256 cellar: :any_skip_relocation, el_capitan:     "50ccb07b44551d4e30ff70213c5e491101db568f0aaee746bb50c0f8d13cc406"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f4273abcf13b3cade71e4f640802a90eb8accacc6a014c1cf0c86aba99159e4e"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"astra"
  end

  def caveats
    "You must have python 3.7+ to use cqlsh and java11+ to use dsbulk"
  end

end
