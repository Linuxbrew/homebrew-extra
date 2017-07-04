class Strace < Formula
  desc "Diagnostic, instructional, and debugging tool for the Linux kernel"
  homepage "https://strace.io/"
  url "https://downloads.sourceforge.net/project/strace/strace/4.17/strace-4.17.tar.xz"
  sha256 "81f35b085fbb3cfa806eb521a8522ac3406deaccfe121ce35064bad268237419"

  bottle do
    sha256 "a88334dff8142b5b45ec73cdbb702946ad7c890be7a40b4e6baa2c25a620eb50" => :x86_64_linux
  end

  head do
    url "https://github.com/strace/strace.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  depends_on "linux-headers"

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
