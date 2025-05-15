class GammarayQt6 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/releases/download/v3.2.0/gammaray-3.2.0.tar.gz"
  sha256 "a7c00a5a33c400579002bbe535a667efdea1e726950ecddbf39cf3d8a3f50f07"
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
