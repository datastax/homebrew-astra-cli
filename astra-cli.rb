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
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "8567fc1e06074085857455c4f6da6f1fd2f14addba5ce0e1595adf2c6607304e"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "8567fc1e06074085857455c4f6da6f1fd2f14addba5ce0e1595adf2c6607304e"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "8567fc1e06074085857455c4f6da6f1fd2f14addba5ce0e1595adf2c6607304e"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "8567fc1e06074085857455c4f6da6f1fd2f14addba5ce0e1595adf2c6607304e"
    sha256 cellar: :any_skip_relocation, sonoma:         "764647e8037c37b4cd8f6b80e4cff46fa75df983cf5049cd917f5c536de5fcf8"
    sha256 cellar: :any_skip_relocation, ventura:        "764647e8037c37b4cd8f6b80e4cff46fa75df983cf5049cd917f5c536de5fcf8"
    sha256 cellar: :any_skip_relocation, monterey:       "764647e8037c37b4cd8f6b80e4cff46fa75df983cf5049cd917f5c536de5fcf8"
    sha256 cellar: :any_skip_relocation, big_sur:        "764647e8037c37b4cd8f6b80e4cff46fa75df983cf5049cd917f5c536de5fcf8"
    sha256 cellar: :any_skip_relocation, catalina:       "764647e8037c37b4cd8f6b80e4cff46fa75df983cf5049cd917f5c536de5fcf8"
    sha256 cellar: :any_skip_relocation, mojave:         "764647e8037c37b4cd8f6b80e4cff46fa75df983cf5049cd917f5c536de5fcf8"
    sha256 cellar: :any_skip_relocation, high_sierra:    "764647e8037c37b4cd8f6b80e4cff46fa75df983cf5049cd917f5c536de5fcf8"
    sha256 cellar: :any_skip_relocation, sierra:         "764647e8037c37b4cd8f6b80e4cff46fa75df983cf5049cd917f5c536de5fcf8"
    sha256 cellar: :any_skip_relocation, el_capitan:     "764647e8037c37b4cd8f6b80e4cff46fa75df983cf5049cd917f5c536de5fcf8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7bef1d9413e167c417871c76bd770b4cafb6c3a058b0652c7cbf2ac57834b283"
  end

  def install
    #libexec.install Dir["*"]
    #bin.install_symlink libexec/"astra"
    system "script/build"
    system "script/install", prefix

    bash_completion.install "contrib/completion/astra-cli.bash" => "astra-cli"
  end

  def caveats
    "You must have python 3.7+ to use cqlsh and java11+ to use dsbulk"
  end

end
