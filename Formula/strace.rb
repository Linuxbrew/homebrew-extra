class Strace < Formula
  desc "Diagnostic, instructional, and debugging tool for the Linux kernel"
  homepage "https://strace.io/"
  url "https://downloads.sourceforge.net/project/strace/strace/4.17/strace-4.17.tar.xz"
  sha256 "81f35b085fbb3cfa806eb521a8522ac3406deaccfe121ce35064bad268237419"

  bottle do
    cellar :any_skip_relocation
    sha256 "e10400bee5b8b59578631915aabc7cde892dc7038ecd1a591d99bedeee4119ba" => :x86_64_linux
  end

  depends_on "linux-headers"

  head do
    url "https://github.com/strace/strace.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  def install
    system "./bootstrap" if build.head?
    system "./configure",
      "--disable-dependency-tracking",
      "--disable-silent-rules",
      "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    out = `"strace" "true" 2>&1` # strace the true command, redirect stderr to output
    assert_match "execve(", out
    assert_match "+++ exited with 0 +++", out
  end
end
