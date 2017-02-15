class Libpipeline < Formula
  desc "Library for manipulating pipelines of subprocesses"
  homepage "http://libpipeline.nongnu.org/"
  url "https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.4.1.tar.gz"
  sha256 "da46d7b20163aadb9db2faae483f734e9096a7550c84b94029abeab62dd1b9ee"

  bottle do
    cellar :any_skip_relocation
    sha256 "683eb078924cbf5e117dea4037ee13847e341781e0bfe042c1966695a47056fb" => :x86_64_linux
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
