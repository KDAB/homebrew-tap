class GammarayQt6 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/releases/download/v3.4.0/gammaray-3.4.0.tar.gz"
  sha256 "bcac8aa24671bcfd563213f5cfd9e61cf555b22ee3896e8111a5c3a588aacadf"
  head "https://github.com/KDAB/GammaRay.git"

  depends_on "qt@6" => "with-d-bus"
  depends_on "kdstatemachineeditor-qt6"
  depends_on "cmake" => :build
  depends_on "ninja" => :build


  def install
    system "cmake", ".", "-G", "Ninja", "-DQT_VERSION_MAJOR=6", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
