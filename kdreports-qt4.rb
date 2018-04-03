class KdreportsQt4 < Formula
  desc "A Qt library for creating printable reports"
  homepage "https://github.com/KDAB/KDReports"
  url "https://github.com/KDAB/KDReports/releases/download/kdreports-1.8.0/kdreports-1.8.0.tar.gz"
  sha256 "e3f7d547fb6b20fa08d120df241bb155f460534253fa75afa7e4696f4a39fdcc"
  head "https://github.com/KDAB/KDReports.git"

  depends_on "qt" => "with-d-bus"
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
