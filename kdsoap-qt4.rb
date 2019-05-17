class KdsoapQt4 < Formula
  desc "A Qt-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://github.com/KDAB/KDSoap/releases/download/kdsoap-1.8.0/kdsoap-1.8.0.tar.gz"
  sha256 "e73fbaf57f01a6d45f8f0530861a8f528bf0216633c2c70617cec4434237e742"
  head "https://github.com/KDAB/KDSoap.git"

  depends_on "qt" => "with-d-bus"

  def install
    system "touch", ".license.accepted"
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
