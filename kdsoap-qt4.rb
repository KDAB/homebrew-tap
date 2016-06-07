class KdsoapQt4 < Formula
  desc "A Qt-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://github.com/KDAB/KDSoap/releases/download/kdsoap-1.5.1/kdsoap-1.5.1.tar.gz"
  sha256 "fc4506a91db59aef33aadba9fa828c59047ac7bfdd13a23fe4ba7b66450d4844"
  head "https://github.com/KDAB/KDSoap.git"

  depends_on "qt" => "with-d-bus"

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
