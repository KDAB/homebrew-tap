class KdsoapQt5 < Formula
  desc "A Qt-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://github.com/KDAB/KDSoap/releases/download/kdsoap-1.10.0/kdsoap-1.10.0.tar.gz"
  sha256 "0c606ecc434466dbadb2829820ca163af60cc7ca226f553b5d4032196737338f"
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
