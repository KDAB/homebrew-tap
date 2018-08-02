class GammarayQt4 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/archive/v2.9.1.tar.gz"
  sha256 "1244ce941ab0167a93798c3c087e1c55534c1092cbf840bb196def5205202ea6"
  head "https://github.com/KDAB/GammaRay.git"

  depends_on "qt" => "with-d-bus"
  depends_on "cmake" => :build

  def install
    system "cmake", "-DGAMMARAY_PROBE_ONLY_BUILD=ON", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
