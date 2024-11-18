class GammarayQt5 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/releases/download/v3.1.0/gammaray-3.1.0.tar.gz"
  sha256 "93b52d5318374896621e1d8b5dd03379c53e0458b1633b539d18737fe8c300cf"
  head "https://github.com/KDAB/GammaRay.git"

  depends_on "qt@5" => "with-d-bus"
  depends_on "kdstatemachineeditor-qt5"
  depends_on "cmake" => :build
  depends_on "ninja" => :build


  def install
    system "cmake", ".", "-G", "Ninja", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
