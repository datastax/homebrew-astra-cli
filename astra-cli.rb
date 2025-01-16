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
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "149efe9618d4072f953bd3a50ea32265744c986607c9878889445373badc6886"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "149efe9618d4072f953bd3a50ea32265744c986607c9878889445373badc6886"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "149efe9618d4072f953bd3a50ea32265744c986607c9878889445373badc6886"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "149efe9618d4072f953bd3a50ea32265744c986607c9878889445373badc6886"
    sha256 cellar: :any_skip_relocation, sonoma:         "dfdbc94a9f4eae1443740786df70bd217a1b1275a72ad51a038f71e1fe06b84c"
    sha256 cellar: :any_skip_relocation, ventura:        "dfdbc94a9f4eae1443740786df70bd217a1b1275a72ad51a038f71e1fe06b84c"
    sha256 cellar: :any_skip_relocation, monterey:       "dfdbc94a9f4eae1443740786df70bd217a1b1275a72ad51a038f71e1fe06b84c"
    sha256 cellar: :any_skip_relocation, big_sur:        "dfdbc94a9f4eae1443740786df70bd217a1b1275a72ad51a038f71e1fe06b84c"
    sha256 cellar: :any_skip_relocation, catalina:       "dfdbc94a9f4eae1443740786df70bd217a1b1275a72ad51a038f71e1fe06b84c"
    sha256 cellar: :any_skip_relocation, mojave:         "dfdbc94a9f4eae1443740786df70bd217a1b1275a72ad51a038f71e1fe06b84c"
    sha256 cellar: :any_skip_relocation, high_sierra:    "dfdbc94a9f4eae1443740786df70bd217a1b1275a72ad51a038f71e1fe06b84c"
    sha256 cellar: :any_skip_relocation, sierra:         "dfdbc94a9f4eae1443740786df70bd217a1b1275a72ad51a038f71e1fe06b84c"
    sha256 cellar: :any_skip_relocation, el_capitan:     "dfdbc94a9f4eae1443740786df70bd217a1b1275a72ad51a038f71e1fe06b84c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b7c2e477e04b1fb774089864d98608a9ff7222859a0d10ea4e0279b56bf8e5cc"
  end

  def install
    #libexec.install Dir["*"]
    #bin.install_symlink libexec/"astra"
    system "script/build"
    system "script/install", prefix

    bash_completion.install "astra-init.sh" => "astra-cli"
  end

  def caveats
    "You must have python 3.7+ to use cqlsh and java11+ to use dsbulk"
  end

end
