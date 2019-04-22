class KdsoapQt4 < Formula
  desc "A Qt-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://github.com/KDAB/KDSoap/releases/download/kdsoap-1.7.0/kdsoap-1.7.0.tar.gz"
  sha256 "c13cd01cc576e22d51f2cd336f1473894a3c78ce5300ceaa23b20420f99234bd"
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
