class KdsoapQt5 < Formula
  desc "A Qt5-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://github.com/KDAB/KDSoap/releases/download/kdsoap-2.3.0/kdsoap-2.3.0.tar.gz"
  sha256 "d2184951145cb768cc30376a10701be13869a164c1272d09f831ba2d195f02de"
  head "https://github.com/KDAB/KDSoap.git"

  depends_on "qt@5" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "ninja" => :build


  def install
    system "cmake", ".", "-G", "Ninja", "-DKDSoap_QT6=OFF", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
