class Kdsoap < Formula
  desc "A Qt-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://build.opensuse.org/source/isv:KDAB/KDSoap/kdsoap-1.4.0.tar.gz"
  sha1 "36a8075c23f75d9ec4e3e4f58e4128f9bda06dd6"
  head "https://github.com/KDAB/KDSoap.git"

  depends_on "qt"

  def install
    touch ".license.accepted"
    system "./configure.sh", "-shared",
                          "-release",
                          "-qmake", "/usr/local/bin/qmake",
                          "-prefix", "#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
