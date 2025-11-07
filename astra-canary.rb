class AstraCanary < Formula
  desc "Command Line Interface for DataStax Astra (Canary version–not guaranteed to be stable)"
  homepage "https://docs.datastax.com/en/astra-cli"
  version "1.0.0-rc.1"
  license "Apache-2.0"
  head "https://github.com/datastax/astra-cli.git", branch: "main"

  conflicts_with "astra-cli", because: "'astra-cli' is the formula for the legacy v0.x Astra CLI. Please uninstall 'astra-cli' to continue." 

  on_macos do
    on_arm do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-macos-arm64.tar.gz"
      sha256 "adb1ccdb971a129fabf6b079a051b664345cfdc0950c986001db290574036a4e"
    end
  
    on_intel do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-macos-x86_64.tar.gz"
      sha256 "08cc423fd18faa73b12edb151f771fe8d48e08baaec456f23f8a6819d1256a26"
    end
  end
  
  on_linux do
    on_arm do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-linux-arm64.tar.gz"
      sha256 "2082055bad07642d950b7ac7a47a2f3bf6aa0d117e930bd72f986291d4372876"
    end
  
    on_intel do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-linux-x86_64.tar.gz"
      sha256 "7c1af37ac0285dbb3a0924bfb2a675da89c74ebe4ee5829cf4cc31f8be110a3f"
    end
  end
  
  def install
    bin.install "bin/astra"
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
    system "#{bin}/astra", "config", "path" 
  end
end
