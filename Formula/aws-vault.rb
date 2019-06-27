class AwsVault < Formula
  desc "Securely store and access AWS credentials in development environments"
  homepage "https://github.com/99designs/aws-vault"
  url "https://github.com/99designs/aws-vault/archive/v4.6.1.tar.gz"
  sha256 "7e4a6195fdbdf4a4e9bac4ce790d7463bba03da0cdcc81fcbca3dd9415027f1e"

  bottle do
    cellar :any_skip_relocation
    sha256 "2381713e06fd1412d421e4f3d6e84eabe54d5c6267be371fb2659272553e9052" => :x86_64_linux
  end

  depends_on "go" => :build

  def install
    ENV["GOOS"] = "linux"
    ENV["GOARCH"] = "amd64"

    system "make", "build"
    bin.install "aws-vault"

    zsh_completion.install "completions/zsh/_aws-vault"
    bash_completion.install "completions/bash/aws-vault"
  end

  test do
    assert_match("aws-vault: error: required argument 'profile' not provided, try --help", shell_output("#{bin}/aws-vault login 2>&1", 1))
  end
end
