class ManDb < Formula
  desc "Unix documentation system"
  homepage "http://man-db.nongnu.org/"
  url "https://download.savannah.gnu.org/releases/man-db/man-db-2.8.3.tar.xz"
  sha256 "5932a1ca366e1ec61a3ece1a3afa0e92f2fdc125b61d236f20cc6ff9d80cc4ac"

  bottle do
    root_url "https://linuxbrew.bintray.com/bottles-extra"
    sha256 "c2508ff862d57e2bd99388d7bd58656bce941e784a5192c53069d64f2fe29bcc" => :x86_64_linux
  end

  head do
    url "git://git.sv.gnu.org/man-db.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "libpipeline"

  unless OS.mac?
    depends_on "gdbm"
    depends_on "groff"
    depends_on "zlib"
  end

  def install
    system "./configure",
      "--disable-dependency-tracking",
      "--disable-silent-rules",
      "--prefix=#{prefix}",
      "--with-systemdtmpfilesdir=#{lib}/tmpfiles.d",
      "--disable-setuid"
    system "make", "install"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/man --help")
  end
end
