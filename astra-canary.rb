class AstraCanary < Formula
  desc "Command Line Interface for DataStax Astra (Canary version–not guaranteed to be stable)"
  homepage "https://docs.datastax.com/en/astra-cli"
  version "1.0.1"
  license "Apache-2.0"
  head "https://github.com/datastax/astra-cli.git", branch: "main"

  conflicts_with "astra-cli", because: "'astra-cli' is the formula for the legacy v0.x Astra CLI. \033[1mPlease uninstall 'astra-cli' to continue.\033[0m" 
  conflicts_with "astra", because: "'astra' is the stable build of Astra CLI. \033[1mPlease uninstall 'astra' to continue.\033[0m" 

  on_macos do
    on_arm do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-macos-arm64.tar.gz"
      sha256 "9db7de4ebfb7d7184a8af3aee2575bd45c68abd00446cf4c013a809ef01b3606"
    end

    on_intel do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-macos-x86_64.tar.gz"
      sha256 "522076050a80bdfa2096af987e9b6c4ca8df13e62403a30d1a52b600c499dd0c"
    end
  end
  
  on_linux do
    on_arm do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-linux-arm64.tar.gz"
      sha256 "b12751e6864c7b9b656982a1cfc047bdc28a9f8cde0163a307800d0e76085aab"
    end

    on_intel do
      url "https://github.com/datastax/astra-cli/releases/download/v#{version}/astra-linux-x86_64.tar.gz"
      sha256 "5037c3c681bc203d874f32242e9bdbaf0788126d887ddab83d9861ee62a88455"
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
