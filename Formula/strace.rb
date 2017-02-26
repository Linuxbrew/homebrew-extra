class Strace < Formula
  desc "Diagnostic, instructional, and debugging tool for the Linux kernel"
  homepage "https://strace.io/"
  url "https://github.com/strace/strace/archive/v4.16.tar.gz"
  sha256 "4a6dcf63f2b3e49b840380396d2a8a5a4fb30ca12f953d82c16236bfe620e45a"
  head "https://github.com/strace/strace.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "c1665cc4585a2788b10b5ed6c5712f8cb3833d543e81699b2c946ddf0ef92783" => :x86_64_linux
  end

  depends_on "linux-headers"
  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    system "./bootstrap"
    system "./configure",
      "--disable-debug",
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
