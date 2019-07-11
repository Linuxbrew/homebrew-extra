class LmSensors < Formula
  desc "Tools for monitoring the temperatures, voltages, and fans"
  homepage "https://github.com/groeck/lm-sensors"
  url "https://github.com/lm-sensors/lm-sensors/archive/V3-5-0.tar.gz"
  version "3.5.0"
  sha256 "f671c1d63a4cd8581b3a4a775fd7864a740b15ad046fe92038bcff5c5134d7e0"

  bottle do
    sha256 "7667ea2cf1e56af98c1045162ad416361a3bcf543d2edd158b29faee3f8a1dcc" => :x86_64_linux
  end

  depends_on "bison" => :build
  depends_on "flex" => :build

  def install
    args = %W[
      PREFIX=#{prefix}
      BUILD_STATIC_LIB=0
      MANDIR=#{man}
      ETCDIR=#{prefix}/etc
    ]
    system "make", *args
    system "make", *args, "install"
  end
end
