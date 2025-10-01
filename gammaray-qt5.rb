class GammarayQt5 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/releases/download/v3.3.0/gammaray-3.3.0.tar.gz"
  sha256 "03fda338025d31b6a2794550f090d538996bbb6f4888eab3acb39db5a17127a8"
  head "https://github.com/KDAB/GammaRay.git"

  depends_on "qt@5" => "with-d-bus"
  depends_on "kdstatemachineeditor-qt5"
  depends_on "cmake" => :build
  depends_on "ninja" => :build


  def install
    system "cmake", ".", "-G", "Ninja", "-DQT_VERSION_MAJOR=5", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
