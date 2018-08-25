class LinuxPam < Formula
  desc "Pluggable Authentication Modules for Linux"
  homepage "http://www.linux-pam.org"
  url "http://linux-pam.org/library/Linux-PAM-1.3.0.tar.bz2"
  sha256 "241aed1ef522f66ed672719ecf2205ec513fd0075ed80cda8e086a5b1a01d1bb"
  revision 1
  # tag "linuxbrew"

  bottle do
    root_url "https://linuxbrew.bintray.com/bottles-extra"
    sha256 "cd4a6dab3977d9c946f131e76e9d7781c3cb5c7fc772d1205ad69b245221139c" => :x86_64_linux
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
