class Kdalgorithms < Formula
  desc "Algorithm helpers - kdalgorithms"
  homepage "https://github.com/KDAB/KDAlgorithms"
  url "https://github.com/KDAB/KDAlgorithms/archive/1.4.tar.gz"
  sha256 "7abce0c714e5766aaf1d62d0c8771c6fbf5266ec90fd084b3258a008bcec85d8"
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
