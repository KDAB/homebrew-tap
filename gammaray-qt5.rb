class GammarayQt5 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/releases/download/v2.11.3/gammaray-2.11.3.tar.gz"
  sha256 "03d7ca7bd5eb600c9c389d0cf071960330592f1f392a783b7fec5f9eaa5df586"
  head "https://github.com/KDAB/GammaRay.git"

  depends_on "qt@5" => "with-d-bus"
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
