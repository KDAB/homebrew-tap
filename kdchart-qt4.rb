class KdchartQt4 < Formula
  desc "A Qt library for creating business and scientific charts"
  homepage "https://github.com/KDAB/KDChart"
  url "https://github.com/KDAB/KDChart/releases/download/kdchart-2.6.2/kdchart-2.6.2.tar.gz"
  sha256 "e3f0f2915f68702d7ea2c45af9b59a39e6a5181290817efbf760d4adba0b2f01"
  head "https://github.com/KDAB/KDChart.git"

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
