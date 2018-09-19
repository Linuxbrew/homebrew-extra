class LinuxPam < Formula
  desc "Pluggable Authentication Modules for Linux"
  homepage "http://www.linux-pam.org"
  url "https://github.com/linux-pam/linux-pam/releases/download/v1.3.1/Linux-PAM-1.3.1.tar.xz"
  sha256 "eff47a4ecd833fbf18de9686632a70ee8d0794b79aecb217ebd0ce11db4cd0db"
  head "https://github.com/linux-pam/linux-pam.git"

  bottle do
    root_url "https://linuxbrew.bintray.com/bottles-extra"
    sha256 "172b34a408deb920569879326b57510eb384068bc4df8146b702be3d26284aef" => :x86_64_linux
  end

  depends_on "pkg-config" => :build
  depends_on "libprelude" => :recommended
  depends_on "berkeley-db"

  skip_clean :la, "etc"

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
      --includedir=#{include}/security
      --oldincludedir=#{include}
      --enable-securedir=#{lib}/security
      --sysconfdir=#{etc}
      --with-xml-catalog=#{etc}/xml/catalog
    ]
    args << "--with-libprelude-prefix=#{Formula["libprelude"].opt_prefix}" if build.with? "libprelude"

    system "./configure", *args
    system "make"
    system "make", "check"
    system "make", "install"
  end

  def post_install
    chmod "u=rwxs,g=rx,o=rx", "#{sbin}/unix_chkpwd"
  end

  test do
    File.exist? "#{sbin}/unix_chkpwd"
    assert_match "Usage", shell_output("#{sbin}/mkhomedir_helper 2>&1", 14)
  end
end
