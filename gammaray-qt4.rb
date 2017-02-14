class GammarayQt4 < Formula
  desc "A Qt-based tool to poke around in a Qt-application and also to manipulate the application to some extent."
  homepage "https://github.com/KDAB/GammaRay"
  url "https://github.com/KDAB/GammaRay/archive/v2.7.0.tar.gz"
  sha256 "74251d9de4bfa31994431c7a493e5de17d0b90853557a245bf3f7f4e0227fd14"
  head "https://github.com/KDAB/GammaRay.git"

  depends_on "qt" => "with-d-bus"
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
