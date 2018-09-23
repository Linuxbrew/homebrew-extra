class Libunwind < Formula
  desc "Library for manipulating pipelines of subprocesses"
  homepage "http://libpipeline.nongnu.org/"
  url "https://download.savannah.nongnu.org/releases/libunwind/libunwind-1.2.1.tar.gz"
  sha256 "3f3ecb90e28cbe53fba7a4a27ccce7aad188d3210bb1964a923a731a27a75acb"

  head do
    url "https://github.com/libunwind/libunwind.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "xz"

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-silent-rules
      --disable-dependency-tracking
      --disable-static
      --enable-coredump
      --enable-ptrace
      --enable-setjmp
      --enable-documentation
      --enable-cxx-exceptions
      --enable-debug-frame
      --enable-msabi-support
      --enable-minidebuginfo
      --enable-conservative-checks
      --enable-block-signals
    ]
    system "./autogen.sh" if build.head?
    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
