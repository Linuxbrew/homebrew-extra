class Libpipeline < Formula
  desc "Library for manipulating pipelines of subprocesses"
  homepage "http://libpipeline.nongnu.org/"
  url "https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.3.1.tar.gz"
  sha256 "5cad1b446f135ec3800d32c8c951a1114f4c438609a4c52b262c30301bc8e692"
  # tag "linuxbrew"

  head do
    url "git://git.savannah.nongnu.org/libpipeline.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  def install
    system "./configure",
      "--disable-debug",
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
