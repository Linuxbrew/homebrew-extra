class AwsVault < Formula
  desc "Securely store and access AWS credentials in development environments"
  homepage "https://github.com/99designs/aws-vault"
  url "https://github.com/99designs/aws-vault/archive/v4.6.3.tar.gz"
  sha256 "89428b99568d67335c5a9a4f74bdc7f4511864aa1dd11a07e7912588bcaa2716"

  bottle do
    cellar :any_skip_relocation
    sha256 "8f45b40c7854ca4a259e98009e7c9d3c0db1829982913ee7c0b5147342bd2e9c" => :x86_64_linux
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
