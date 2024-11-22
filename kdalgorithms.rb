class Kdalgorithms < Formula
  desc "Algorithm helpers - kdalgorithms"
  homepage "https://github.com/KDAB/KDAlgorithms"
  url "https://github.com/KDAB/KDAlgorithms/archive/1.3.tar.gz"
  sha256 "3bf02aebec20f23d3c1389c3fb15bc54874814bb34fd399314e28ddf7bc26598"
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
