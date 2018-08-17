class ManDb < Formula
  desc "Unix documentation system"
  homepage "http://man-db.nongnu.org/"
  url "https://download.savannah.gnu.org/releases/man-db/man-db-2.8.4.tar.xz"
  sha256 "103c185f9d8269b9ee3b8a4cb27912b3aa393e952731ef96fedc880723472bc3"

  bottle do
    root_url "https://linuxbrew.bintray.com/bottles-extra"
    sha256 "199c10d26aaf0dc22be777b238e0a40111004281f5ec030d8a9b387b739b65cd" => :x86_64_linux
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
