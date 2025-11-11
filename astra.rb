class Astra < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://docs.datastax.com/en/astra-cli"
  version "1.0.0"
  license "Apache-2.0"
  head "https://github.com/datastax/astra-cli.git", branch: "main"

  conflicts_with "astra-cli", because: "'astra-cli' is the formula for the legacy v0.x Astra CLI. \033[1mPlease uninstall 'astra-cli' to continue.\033[0m" 
  conflicts_with "astra-canary", because: "'astra-canary' is the canary build of Astra CLI. \033[1mPlease uninstall 'astra-canary' to continue.\033[0m" 

  on_macos do
    on_arm do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-macos-arm64.tar.gz"
      sha256 "cd62f37999d7fe2b500372d2fa22d56427022d37be8086c21f72d387f24baa77"
    end

    on_intel do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-macos-x86_64.tar.gz"
      sha256 "026d7b4cebce1e6e78fd1e7e4b5f8468861cd72deaded06a87baacf4c31044fd"
    end
  end
  
  on_linux do
    on_arm do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-linux-arm64.tar.gz"
      sha256 "76f7b1ea23fd1c864405c6a052fa11cc5c0405222c4b57e05259ce07167bc5de"
    end

    on_intel do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-linux-x86_64.tar.gz"
      sha256 "39000e000028ca33debe2fc95cbe4022924a5cb2030b40c84c52ee8337b64847"
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
