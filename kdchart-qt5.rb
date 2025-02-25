class KdchartQt5 < Formula
  desc "A Qt5-based library for creating business and scientific charts"
  homepage "https://github.com/KDAB/KDChart"
  url "https://github.com/KDAB/KDChart/releases/download/kdchart-3.0.0/kdchart-3.0.0.tar.gz"
  sha256 "57359cb9593b5a7866b4b41d9397ca4386316559d449a57b4fe2ab491bb304e9"
  head "https://github.com/KDAB/KDChart.git"

  depends_on "qt@5" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "ninja" => :build


  def install
    system "cmake", ".", "-G", "Ninja", "-DKDChart_QT6=OFF", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
