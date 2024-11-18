class KdreportsQt6 < Formula
  desc "A Qt6-based library for creating printable reports"
  homepage "https://github.com/KDAB/KDReports"
  url "https://github.com/KDAB/KDReports/releases/download/kdreports-2.3.0/kdreports-2.3.0.tar.gz"
  sha256 "206e1b26302fec8a7bda4d3f362ebd249ad55f4cc7f241a7b5abd778738f8ace"
  head "https://github.com/KDAB/KDReports.git"

  depends_on "qt@6" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "ninja" => :build


  def install
    system "cmake", ".", "-G", "Ninja", "-DKDReports_QT6=True", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
