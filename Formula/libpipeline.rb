class Libpipeline < Formula
  desc "Library for manipulating pipelines of subprocesses"
  homepage "http://libpipeline.nongnu.org/"
  url "https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.4.2.tar.gz"
  sha256 "fef1fc9aa40ce8796f18cd1aecd888a9484a9556c8b0f8d07c863578277679be"

  bottle do
    sha256 "1aadf9bcd7d5a8d974599654e9359163fda482caab1bfc104e97e7a8cbd7f1e7" => :x86_64_linux
  end

  head do
    url "git://git.savannah.nongnu.org/libpipeline.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  def install
    system "./configure",
      "--disable-dependency-tracking",
      "--disable-silent-rules",
      "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"input.txt").write "a\nb"
    (testpath/"test.c").write <<-EOS.undent
      #include <pipeline.h>

      int main(int argc, char** argv) {
        pipeline* p = pipeline_new();
        pipeline_want_infile(p, "input.txt");
        pipeline_command_args(p, "grep", "b", NULL);
        return pipeline_run(p);
      }
    EOS
    system ENV.cc, "test.c", "-o", "test", "-lpipeline"
    assert_equal "b", shell_output("./test").strip
  end
end
