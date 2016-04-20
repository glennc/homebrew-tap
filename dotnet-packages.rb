class DotnetPackages < Formula
  desc "Command line tool to examine the dependencies of your .NET application"
  homepage "https://github.com/glennc/dotnet-packages"
  url "https://github.com/glennc/dotnet-packages/archive/0.0.2.tar.gz"
  version "0.0.2"
  sha256 "ebb151dd8de486494d337e427fff31fa64276184dad447886997313633679f25"

  bottle do
    cellar :any
    root_url "https://github.com/glennc/dotnet-packages/releases/download/0.0.2"
    sha256 "8e35ef85c16f98fdeb988a6a984257837893897e81b79d5c35573871fe5fca57" => :el_capitan    
  end

  def install
    system "/usr/local/bin/dotnet", "restore"
    system "/usr/local/bin/dotnet", "publish", "-o", "./output", "--configuration", "release"
    prefix.install Dir["output/*"]

    bin.install_symlink "#{prefix}/dotnet-packages-0.0.2" => "dotnet-packages"
  end
end
