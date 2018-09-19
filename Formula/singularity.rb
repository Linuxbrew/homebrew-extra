class Singularity < Formula
  desc "Application containers for Linux"
  homepage "https://www.sylabs.io/singularity/"
  url "https://github.com/singularityware/singularity/releases/download/2.6.0/singularity-2.6.0.tar.gz"
  sha256 "7c425211a099f6fa6f74037e6e17be58fb5923b0bd11aea745e48ef83c488b49"

  depends_on "python@2" => :build
  depends_on "libarchive"
  depends_on "squashfs"

  def install
    system "./configure",
      "--with-userns",
      "--with-mksquashfs=#{Formula["squashfs"].bin}/mksquashfs",
      "--prefix=#{prefix}",
      "--disable-dependency-tracking",
      "--disable-silent-rules"
    system "make", "install"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/singularity --help")
  end
end
