class Strace < Formula
  desc "Diagnostic, instructional, and debugging tool for the Linux kernel"
  homepage "https://strace.io/"
  url "https://github.com/strace/strace/releases/download/v4.24/strace-4.24.tar.xz"
  sha256 "1f4e59fc1edfa2bfb4adf2a748623dc25b105ec79713dd84404199f91b0b0634"

  bottle do
    root_url "https://linuxbrew.bintray.com/bottles-extra"
    cellar :any_skip_relocation
    sha256 "e83c8b2aeb483058f12c30389181fa51be6a9fee3222cc0c9b6ee6ca662afebd" => :x86_64_linux
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
      "--prefix=#{prefix}",
      "--enable-mpers=no" # FIX: configure: error: Cannot enable m32 personality support
    system "make", "install"
  end

  test do
    out = `"strace" "true" 2>&1` # strace the true command, redirect stderr to output
    assert_match "execve(", out
    assert_match "+++ exited with 0 +++", out
  end
end
