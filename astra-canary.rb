class AstraCanary < Formula
  desc "Command Line Interface for DataStax Astra (Canary version–not guaranteed to be stable)"
  homepage "https://docs.datastax.com/en/astra-cli"
  version "1.0.0-rc.2"
  license "Apache-2.0"
  head "https://github.com/datastax/astra-cli.git", branch: "main"

  conflicts_with "astra-cli", because: "'astra-cli' is the formula for the legacy v0.x Astra CLI. Please uninstall 'astra-cli' to continue." 

  on_macos do
    on_arm do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-macos-arm64.tar.gz"
      sha256 "b2d58e84051b85cbebfd30597e5fc96c46d1eddce195f68a610df8b64e8167cd"
    end
  
    on_intel do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-macos-x86_64.tar.gz"
      sha256 "8609324eab9ed9845d121bef9ce541552fac9b1fe29c46d878308485815239ed"
    end
  end
  
  on_linux do
    on_arm do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-linux-arm64.tar.gz"
      sha256 "ff600e22abfd77d8c4ae36e5a3175dca8ab5e4d8a58367b9e865b7726f63b7ac"
    end
  
    on_intel do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-linux-x86_64.tar.gz"
      sha256 "64abafad6d968a52a634ae3ba1eace699346d6442624edd9267491b15ed03e82"
    end
  end
  
  def install
    bin.install "bin/astra"
    generate_completions_from_executable bin/"astra", "compgen", shell_parameter_format: :none, shells: [:bash, :zsh]
  end

  def caveats
    <<~EOS
      \033[1;34m-------------------------\033[0m
      \033[1;34m  ENABLE AUTOCOMPLETION  \033[0m
      \033[1;34m-------------------------\033[0m
      Add the following to your shell profile (e.g. ~/.zprofile, ~/.bash_profile, etc.):
      
      \033[1;32meval "$(#{bin}/astra shellenv)"\033[0m

      Once added, reload your shell or source your profile.

      \033[1;34m-------------------\033[0m
      \033[1;34m SPECIAL COMMANDS  \033[0m
      \033[1;34m-------------------\033[0m
      
      - CQLSH: Requires Python >=3.7,<3.12 on your system. 3.12+ is not supported.
      - DSBULK: Requires JDK 11+ to run.

    EOS
  end

  test do
    system bin"/astra", "config", "path"
    system bin/"astra", "compgen"
  end
end
