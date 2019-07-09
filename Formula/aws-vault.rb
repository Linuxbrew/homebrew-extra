class AwsVault < Formula
  desc "Securely store and access AWS credentials in development environments"
  homepage "https://github.com/99designs/aws-vault"
  url "https://github.com/99designs/aws-vault/archive/v4.6.1.tar.gz"
  sha256 "7e4a6195fdbdf4a4e9bac4ce790d7463bba03da0cdcc81fcbca3dd9415027f1e"
  revision 1

  bottle do
    cellar :any_skip_relocation
    sha256 "1747b69ac2c092e9e5134ad121791feb5cfa2f91393d692b34a1b91338b6d979" => :x86_64_linux
  end

  depends_on "go" => :build

  def install
    ENV["GOOS"] = "linux"
    ENV["GOARCH"] = "amd64"

    flags = "-X main.Version=#{version} -s -w"

    system "go", "build", "-ldflags=#{flags}"
    bin.install "aws-vault"

    zsh_completion.install "completions/zsh/_aws-vault"
    bash_completion.install "completions/bash/aws-vault"
  end

  test do
    assert_match("aws-vault: error: required argument 'profile' not provided, try --help", shell_output("#{bin}/aws-vault login 2>&1", 1))
  end
end
