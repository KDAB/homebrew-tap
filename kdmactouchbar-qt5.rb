class KdmactouchbarQt5 < Formula
  desc "Qt Widget for the Mac Touch Bar"
  homepage "https://github.com/KDAB/KDMacTouchBar"
  url "https://github.com/KDAB/KDMacTouchBar/archive/v1.1.3.tar.gz"
  sha256 "bfed617880f9a3f8553b8a23a0613b0e9c834934efcbac8f2c3f22b35947dff0"
  head "https://github.com/KDAB/KDMacTouchBar.git"

  depends_on "qt@5" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "ninja" => :build


  def install
    system "cmake", ".", "-G", "Ninja", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

end
