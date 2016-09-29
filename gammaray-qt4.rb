class GammarayQt4 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/archive/v2.6.0.tar.gz"
  sha256 "762fc1e61fb141462e72fe048b4a7bbf1063eea6a2209963c8aa1ad7696b0217"
  head "https://github.com/KDAB/GammaRay.git"

  depends_on "qt" => "with-d-bus"
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
