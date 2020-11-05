class KdreportsQt5 < Formula
  desc "A Qt library for creating printable reports"
  homepage "https://github.com/KDAB/KDReports"
  url "https://github.com/KDAB/KDReports/releases/download/kdreports-1.9.0/kdreports-1.9.0.tar.gz"
  sha256 "83914a1b907d6d4a6d9f434984d6003c865264c6b0c4b92cad2c1e5c84b21a91"
  head "https://github.com/KDAB/KDReports.git"

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
