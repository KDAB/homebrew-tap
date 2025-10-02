class GammarayQt5 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/releases/download/v3.2.2/gammaray-3.2.2.tar.gz"
  sha256 "18830a83ca8ba8e6e07d78a88d933c2666eda4b26d3cbdc97e06914f5e92388c"
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
