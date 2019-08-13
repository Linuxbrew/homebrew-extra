class Minikube < Formula
  desc "Run a Kubernetes cluster locally"
  homepage "https://github.com/kubernetes/minikube"
  url "https://github.com/kubernetes/minikube/archive/v1.3.0.tar.gz"
  sha256 "8bde0a2ddddded46383ec4a09727382e0ed584a964abb1f6bfcc87545c652206"

  bottle do
    cellar :any_skip_relocation
    sha256 "d61f5a0ebb1921c6a651214d41b8c9133a9ee8375ece00972b4478417cf3c8f3" => :x86_64_linux
  end

  depends_on "go" => :build

  def install
    ENV["GOOS"] = "linux"
    ENV["GOARCH"] = "amd64"

    system "make"
    bin.install "out/minikube"
  end

  test do
    assert_match("config modifies minikube config files using subcommands like \"minikube config set vm-driver kvm\"", shell_output("#{bin}/minikube config"))
  end
end
