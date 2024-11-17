class KdmactouchbarQt5 < Formula
  desc "Qt Widget for the Mac Touch Bar"
  homepage "https://github.com/KDAB/KDMacTouchBar"
  url "https://github.com/KDAB/KDMacTouchBar/archive/v1.0.0.tar.gz"
  sha256 "d6ca70ab9ffbe12d247e19357c833561bb8cfe7ba1909c06962f009ee65e7a47"
  head "https://github.com/KDAB/KDMacTouchBar.git"

  depends_on "qt@5" => "with-d-bus"
  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

end
