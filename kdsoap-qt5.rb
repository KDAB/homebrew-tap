class KdsoapQt5 < Formula
  desc "A Qt-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://github.com/KDAB/KDSoap/releases/download/kdsoap-1.9.0/kdsoap-1.9.1.tar.gz"
  sha256 "a020ea26e91a2bcdbfa7bc631870ed07be2c583ae29114cfe72a5a94e0e93d27"
  head "https://github.com/KDAB/KDSoap.git"

  depends_on "qt5" => "with-d-bus"

  def install
    system "touch", ".license.accepted"
    system "./configure.sh", "-shared",
                          "-release",
                          "-qmake", "/usr/local/opt/qt5/bin/qmake",
                          "-prefix", "#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
