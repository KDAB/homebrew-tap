class GammarayQt5 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/archive/v2.11.2.tar.gz"
  sha256 "faaaa3354d6031b4796eaaf1699a04543d29875971a751c09c7d1775e1df7ce9"
  head "https://github.com/KDAB/GammaRay.git"

  depends_on "qt5" => "with-d-bus"
  depends_on "kdstatemachineeditor-qt5"
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
