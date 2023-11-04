class AstraCli < Formula
  desc "Command Line Interface for DataStax Astra"
  homepage "https://awesome-astra.github.io/docs/pages/astra/astra-cli/"
  url "https://github.com/datastax/astra-cli/releases/download/0.5/astra-cli-0.5-homebrew.tar.gz"
  sha256 "50ccb07b44551d4e30ff70213c5e491101db568f0aaee746bb50c0f8d13cc406"
  
  license "Apache-2.0"
  depends_on "openjdk@17"

  bottle do
    root_url "https://github.com/datastax/astra-cli/releases/download/0.5"

    # Apple Silicon bottle
    # sha256 "your_apple_silicon_bottle_sha256" => :arm64_big_sur

    # Intel macOS bottle
    sha256 "50ccb07b44551d4e30ff70213c5e491101db568f0aaee746bb50c0f8d13cc406" => :big_sur

    #Linux
    sha256 "f4273abcf13b3cade71e4f640802a90eb8accacc6a014c1cf0c86aba99159e4e" => :x86_64_linux
  end
  
   

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"astra"
  end
end
