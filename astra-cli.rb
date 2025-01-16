class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  url "https://github.com/datastax/astra-cli.git",
      tag:      "0.6",
      revision: "edce75c89ebfbc0b274e602cba5fb5bea7cc5ad8"
  license "Apache-2.0"
  head "https://github.com/datastax/astra-cli.git", branch: "main"

bottle do
    root_url "https://github.com/datastax/astra-cli/releases/download/0.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "14a6825a8d216120dd40fefbcb1b1ed407c6dd3a8349fb818c4687f82cd3ceea"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "14a6825a8d216120dd40fefbcb1b1ed407c6dd3a8349fb818c4687f82cd3ceea"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "14a6825a8d216120dd40fefbcb1b1ed407c6dd3a8349fb818c4687f82cd3ceea"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "14a6825a8d216120dd40fefbcb1b1ed407c6dd3a8349fb818c4687f82cd3ceea"
    sha256 cellar: :any_skip_relocation, sonoma:         "d30fa104240a4ed4509eacd7314d9b0b14c7570f6a84c0349a13c6adcd9405fd"
    sha256 cellar: :any_skip_relocation, ventura:        "d30fa104240a4ed4509eacd7314d9b0b14c7570f6a84c0349a13c6adcd9405fd"
    sha256 cellar: :any_skip_relocation, monterey:       "d30fa104240a4ed4509eacd7314d9b0b14c7570f6a84c0349a13c6adcd9405fd"
    sha256 cellar: :any_skip_relocation, big_sur:        "d30fa104240a4ed4509eacd7314d9b0b14c7570f6a84c0349a13c6adcd9405fd"
    sha256 cellar: :any_skip_relocation, catalina:       "d30fa104240a4ed4509eacd7314d9b0b14c7570f6a84c0349a13c6adcd9405fd"
    sha256 cellar: :any_skip_relocation, mojave:         "d30fa104240a4ed4509eacd7314d9b0b14c7570f6a84c0349a13c6adcd9405fd"
    sha256 cellar: :any_skip_relocation, high_sierra:    "d30fa104240a4ed4509eacd7314d9b0b14c7570f6a84c0349a13c6adcd9405fd"
    sha256 cellar: :any_skip_relocation, sierra:         "d30fa104240a4ed4509eacd7314d9b0b14c7570f6a84c0349a13c6adcd9405fd"
    sha256 cellar: :any_skip_relocation, el_capitan:     "d30fa104240a4ed4509eacd7314d9b0b14c7570f6a84c0349a13c6adcd9405fd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "5c677e83ecef4f479353901c0bade4d1da20531cb1aae93b8ff92879789f6358"
  end

  def install
    #libexec.install Dir["*"]
    #bin.install_symlink libexec/"astra"
    system "script/build"
    system "script/install", prefix

    bash_completion.install "contrib/completion/astra-cli.bash" => "astra-cli"
  end

  def caveats
    <<~EOS
      \033[1;34m------------------------\033[0m
      \033[1;34m  ENABLE AUTOCOMPLETION\033[0m
      \033[1;34m-------------------------\033[0m
      To enable Bash completion for Astra CLI (and other brew formulae when enable, add the following to your shell configuration file (e.g. ~/.zshrc):
      
      \033[1;32mif [ -f  /opt/homebrew/etc/bash_completion.d ]; then\033[0m
      \033[1;32m  .  /opt/homebrew/etc/bash_completion.d\033[0m
      \033[1;32mfi\033[0m

      Once added, reload your shell or run:

      source /opt/homebrew/etc/bash_completion.d

      This will ensure the Bash completion script for Astra CLI is loaded.

      \033[1;34m-------------------\033[0m
      \033[1;34m SPECIAL COMMANDS\033[0m
      \033[1;34m-------------------\033[0m
      
      - CQLSH: You must have python 3.7+ but less than 3.12, cqlsh is still not compatible with 3.12, downgrade if needed
      - DSBULK: You must have java11+ installm the cli is pulling regular dsbulk
      
    EOS
  end

end
