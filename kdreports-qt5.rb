class KdreportsQt5 < Formula
  desc "A Qt5-based library for creating printable reports"
  homepage "https://github.com/KDAB/KDReports"
  url "https://github.com/KDAB/KDReports/releases/download/kdreports-2.1.0/kdreports-2.1.0.tar.gz"
  sha256 "ec2f847fbecf2334da44d84b06ec8986ecd7a63f213c2e8bb1141ae525a4786f"
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
