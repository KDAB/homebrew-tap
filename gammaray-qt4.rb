class GammarayQt4 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/archive/v2.8.2.tar.gz"
  sha256 "0c0ca35399d5977bf4057bd5b8df3da683899638383881f36de50d1fa2754060"
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
