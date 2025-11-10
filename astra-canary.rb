class AstraCanary < Formula
  desc "Command Line Interface for DataStax Astra (Canary version–not guaranteed to be stable)"
  homepage "https://docs.datastax.com/en/astra-cli"
  version "1.0.0-rc.5"
  license "Apache-2.0"
  head "https://github.com/datastax/astra-cli.git", branch: "main"

  conflicts_with "astra-cli", because: "'astra-cli' is the formula for the legacy v0.x Astra CLI. \033[1mPlease uninstall 'astra-cli' to continue.\033[0m" 

  on_macos do
    on_arm do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-macos-arm64.tar.gz"
      sha256 "d86d0281fe6fba8a9c55ab42917781cb9a7d99e5b789b576adf3535e7f3f16db"
    end
  
    on_intel do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-macos-x86_64.tar.gz"
      sha256 "1f3f08ef8f139bde6369319eb74f8efcfe27ff53555bef0cb1d9018dfbe8b485"
    end
  end
  
  on_linux do
    on_arm do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-linux-arm64.tar.gz"
      sha256 "65b6374fcaf3134591edc2d5077dc3d42cbaedb8a00fb8edb9bfc0076bc3eb9b"
    end
  
    on_intel do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-linux-x86_64.tar.gz"
      sha256 "66600a7587cee558a60d6725789d5ae9fcf11e1b79dff1669a407b1e24fe6c86"
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
