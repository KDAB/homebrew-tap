class KdreportsQt5 < Formula
  desc "A Qt library for creating printable reports"
  homepage "https://github.com/KDAB/KDReports"
  url "https://github.com/KDAB/KDReports/releases/download/kdreports-1.7.1/kdreports-1.7.1.tar.gz"
  sha256 "5afc29badab3f683cf9f288a3a1db505d730b851639ab22e46e7b496c6b8c475"
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
