class KdreportsQt6 < Formula
  desc "A Qt6-based library for creating printable reports"
  homepage "https://github.com/KDAB/KDReports"
  url "https://github.com/KDAB/KDReports/releases/download/kdreports-2.2.0/kdreports-2.2.0.tar.gz"
  sha256 "1e4c96564e016198fcd9d25b0047abe0a988be263239bb8d027f26b21f6f406c"
  head "https://github.com/KDAB/KDReports.git"

  depends_on "qt6" => "with-d-bus"
  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-DKDReports_QT6=True", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
