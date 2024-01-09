class KdsoapQt6 < Formula
  desc "A Qt6-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://github.com/KDAB/KDSoap/releases/download/kdsoap-2.2.0/kdsoap-2.2.0.tar.gz"
  sha256 "d9ef11948442197c9fa44bd6fbadc842b7280a60dfc40577af66fded637af356"
  head "https://github.com/KDAB/KDSoap.git"

  depends_on "qt6" => "with-d-bus"
  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-DKDSoap_QT6=True", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
