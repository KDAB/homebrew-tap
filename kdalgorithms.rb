class Kdalgorithms < Formula
  desc "Algorithm helpers - kdalgorithms"
  homepage "https://github.com/KDAB/KDAlgorithms"
  url "https://github.com/KDAB/KDAlgorithms/archive/357844a5936186cf9042fed0ced08db1cdb92942.tar.gz"
  sha256 "6734530b84676d402c85cf31f52631c8787037c59b9b2e515e4afe94cbe51e26"
  head "https://github.com/KDAB/KDAlgorithms.git"
  version "1.3.0-beta1"

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
