class Kdbindings < Formula
  desc "Reactive programming & data binding in C++"
  homepage "https://github.com/KDAB/KDBindings"
  url "https://github.com/KDAB/KDBindings/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "0ee07cb3e2ec4f5688b4b2971c42e5a4f4a41c7bf4aa130e6b118bea4b6340ab"
  head "https://github.com/KDAB/KDBindings.git"

  depends_on "cmake" => :build
  depends_on "ninja" => :build

  def install
    system "cmake", ".", "-G", "Ninja", "-DKDBindigs_TESTS=OFF", "-DKDBindings_EXAMPLES=OFF", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
