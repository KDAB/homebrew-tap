class KdsoapQt5 < Formula
  desc "A Qt-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://github.com/KDAB/KDSoap/releases/download/kdsoap-1.6.0/kdsoap-1.6.0.tar.gz"
  sha256 "d6b6b01348d2e1453f7e12724d1848ee41c86a1b19168ca67ac98fedb0408668"
  head "https://github.com/KDAB/KDSoap.git"

  depends_on "qt5" => "with-d-bus"

  def install
    touch ".license.accepted"
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
