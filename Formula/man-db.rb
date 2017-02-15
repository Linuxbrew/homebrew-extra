class ManDb < Formula
  desc "Unix documentation system"
  homepage "http://man-db.nongnu.org/"
  url "https://download.savannah.gnu.org/releases/man-db/man-db-2.7.6.1.tar.xz"
  sha256 "08edbc52f24aca3eebac429b5444efd48b9b90b9b84ca0ed5507e5c13ed10f3f"

  bottle do
    sha256 "4437811b171f2e4f9831a87a7c435dab3224011506246628449700838f7869fe" => :x86_64_linux
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
    system "#{bin}/man", "--version"
  end
end
