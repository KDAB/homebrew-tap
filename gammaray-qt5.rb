class GammarayQt5 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/releases/download/v3.2.1/gammaray-3.2.1.tar.gz"
  sha256 "82d924fb858985f3d0227d065b81d2267af40f7158aca9bb4ac61305f5961ee6"
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
