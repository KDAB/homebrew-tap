class KdsoapQt5 < Formula
  desc "A Qt5-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://github.com/KDAB/KDSoap/releases/download/kdsoap-2.2.0/kdsoap-2.2.0.tar.gz"
  sha256 "d9ef11948442197c9fa44bd6fbadc842b7280a60dfc40577af66fded637af356"
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
