class DotnetPackages < Formula
  desc "Command line tool to examine the dependencies of your .NET application"
  homepage "https://github.com/glennc/dotnet-packages"
  url "https://github.com/glennc/dotnet-packages/archive/0.0.1.tar.gz"
  version "0.0.1"
  sha256 "a2ad5c9bccd9d7c42ae99434b7852b28a19774e2515e5eeb595ec8cc2d1cc849"

  bottle do
    cellar :any
    sha256 "ff6584964fff27489c8492b29857d07cc0c43f25dfafa5c88de5d47ea48b7350" => :el_capitan
  end

  def install
    system "/usr/local/bin/dotnet", "restore"
    system "/usr/local/bin/dotnet", "publish", "-o", "./output", "--configuration", "release"
    prefix.install Dir["output/*"]

    bin.install_symlink "#{prefix}/dotnet-packages-0.0.1" => "dotnet-packages"
  end
end
