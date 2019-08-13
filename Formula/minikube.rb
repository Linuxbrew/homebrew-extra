class Minikube < Formula
  desc "Run a Kubernetes cluster locally"
  homepage "https://github.com/kubernetes/minikube"
  url "https://github.com/kubernetes/minikube/archive/v1.3.1.tar.gz"
  sha256 "7aa57e5896852c499f1687fbc424abf93645e1801fc9f8c2833e0affbb76eb41"

  bottle do
    cellar :any_skip_relocation
    sha256 "d61f5a0ebb1921c6a651214d41b8c9133a9ee8375ece00972b4478417cf3c8f3" => :x86_64_linux
  end

  depends_on "go" => :build

  def install
    ENV.deparallelize
    ENV["GOOS"] = "linux"
    ENV["GOARCH"] = "amd64"

    system "make"
    bin.install "out/minikube"
  end

  test do
    assert_match("config modifies minikube config files using subcommands like \"minikube config set vm-driver kvm\"", shell_output("#{bin}/minikube config"))
  end
end
