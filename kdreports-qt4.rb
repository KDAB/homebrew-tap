class KdreportsQt4 < Formula
  desc "A Qt library for creating printable reports"
  homepage "https://github.com/KDAB/KDReports"
  url "https://github.com/KDAB/KDReports/releases/download/kdreports-1.8.2/kdreports-1.8.2.tar.gz"
  sha256 "5de22d8f6bd566c2bed07bd4b3d3525463cab024fae4053a8024e8f3c7855de2"
  head "https://github.com/KDAB/KDReports.git"

  depends_on "qt" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "ninja" => :build


  def install
    system "cmake", ".", "-G", "Ninja", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
