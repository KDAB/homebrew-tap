class KdreportsQt5 < Formula
  desc "A Qt library for creating printable reports"
  homepage "https://github.com/KDAB/KDReports"
  url "https://github.com/KDAB/KDReports/releases/download/kdreports-1.8.1/kdreports-1.8.1.tar.gz"
  sha256 "3a6dc6a9effa56bce577e98db937563601db215731dc0018a422245a18c22707"
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
