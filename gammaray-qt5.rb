class GammarayQt5 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/archive/v2.4.0.tar.gz"
  sha256 "9dd517420b132db556a328f272f83dbb2021e4c0f9ee5d3c23659c039cf48718"

  depends_on "qt5"
  depends_on "kdstatemachineeditor-qt5"
  depends_on "graphviz"
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
