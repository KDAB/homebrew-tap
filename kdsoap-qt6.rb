class KdsoapQt6 < Formula
  desc "A Qt6-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://github.com/KDAB/KDSoap/releases/download/kdsoap-2.1.1/kdsoap-2.1.1.tar.gz"
  sha256 "aed57f6b200ddf762f5d2898f7e9228dd0700881c4491aefe4006f7fa5f5c627"
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
