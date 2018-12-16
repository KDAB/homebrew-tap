class GammarayQt4 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/archive/v2.10.0.tar.gz"
  sha256 "d9a816eb8f1ac1ae227d280d84ef23aee83e99fadc5269ef53d53d0aad5496d2"
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
