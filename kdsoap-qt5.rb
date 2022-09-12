class KdsoapQt5 < Formula
  desc "A Qt5-based client-side and server-side SOAP component"
  homepage "https://github.com/KDAB/KDSoap"
  url "https://github.com/KDAB/KDSoap/releases/download/kdsoap-2.1.0/kdsoap-2.1.0.tar.gz"
  sha256 "3eec5568a14ff575b3d14c582de62dd8fddd132429859a6d8cea9892709f5ff4"
  head "https://github.com/KDAB/KDSoap.git"

  depends_on "qt5" => "with-d-bus"
  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
