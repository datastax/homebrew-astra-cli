class AstraCanary < Formula
  desc "Command Line Interface for DataStax Astra (Canary version–not guaranteed to be stable)"
  homepage "https://docs.datastax.com/en/astra-cli"
  version "1.0.0-rc.4"
  license "Apache-2.0"
  head "https://github.com/datastax/astra-cli.git", branch: "main"

  conflicts_with "astra-cli", because: "'astra-cli' is the formula for the legacy v0.x Astra CLI. \033[1mPlease uninstall 'astra-cli' to continue.\033[0m" 

  on_macos do
    on_arm do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-macos-arm64.tar.gz"
      sha256 "935d0e39b716f77fc8e44ca0aa804bb221d46f51c3e7e246a26313992e2225e6"
    end
  
    on_intel do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-macos-x86_64.tar.gz"
      sha256 "4390ba8ef92e91564fdbacfa594ccc451e784130b8cea563727631fd83871b21"
    end
  end
  
  on_linux do
    on_arm do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-linux-arm64.tar.gz"
      sha256 "37c7dde02c7b99d463119e4ff18b2df83ef84a687c4e05ffa5fd8eedbec38d1c"
    end
  
    on_intel do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-linux-x86_64.tar.gz"
      sha256 "e55228abb7f41552e9ceafc04dbf8fa2bde02d589fbcac9d94ca9a2d532e10bb"
    end
  end
  
  def install
    existing_astra = which("astra")

    if existing_astra && !existing_astra.to_s.include?("Cellar")
      odie "Found existing 'astra' installation at: #{existing_astra}\n" \
           "Please uninstall it (or at least remove it from your PATH) before installing astra-canary."
    end

    bin.install "bin/astra"
    generate_completions_from_executable bin/"astra", "compgen", shell_parameter_format: :none, shells: [:bash, :zsh]
  end

  def caveats
    <<~EOS
      \033[1;34m-------------------\033[0m
      \033[1;34m SPECIAL COMMANDS  \033[0m
      \033[1;34m-------------------\033[0m
      
      - CQLSH: Requires Python >=3.7,<3.12 on your system. 3.12+ is not supported.
      - DSBULK: Requires JDK 11+ to run.

    EOS
  end

  test do
    system bin/"astra", "config", "path"
    system bin/"astra", "compgen"
  end
end
