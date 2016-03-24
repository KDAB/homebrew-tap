class KdsoapQt5 < Formula
  desc "A Qt-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://github.com/KDAB/KDSoap/releases/download/kdsoap-1.5.0/kdsoap-1.5.0.tar.gz"
  sha256 "da46eb676d7b05393bddf8c78c0dc8256419d61f34e10c2951d9855f2b78d4e6"
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
