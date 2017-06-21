class Minishift < Formula
  desc "Runs a single-node OpenShift cluster inside a VM in Linux"
  homepage "https://minishift.io/"
  url "https://github.com/minishift/minishift/releases/download/v1.1.0/minishift-1.1.0-linux-amd64.tgz"
  version "1.1.0"
  sha256 "6eb46670dd7df1696db20137cfc9bff6a84d42d9e846a329746c53a36163bb90"

  bottle :unneeded

  def install
    bin.install "minishift"
  end

  test do
    assert_equal "minishift v#{version}\n", shell_output("#{bin}/minishift version")
  end
end
