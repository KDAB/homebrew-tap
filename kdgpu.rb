class Kdutils < Formula
  desc "Helpers and wrappers around the C++ STL and a base for cross-platform applications, similar to QtCore"
  homepage "https://github.com/KDAB/KDGpu"
  url "https://github.com/KDAB/KDGpu/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "eb57188e1e8b0d90c6940ed48cce3069c57f3b5218c0ab115e26460bf7c5618b"
  head "https://github.com/KDAB/KDGpu.git"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "glm"
  depends_on "openxr"
  depends_on "stb"
  depends_on "vulkan-loader"
  depends_on "KDUtils"
  depends_on "spdlog"
  depends_on "fmt"

  def install
    # Upstream of the following repos aren't in brew, require FetchContent
    #   https://github.com/gpakosz/whereami
    #   https://github.com/mandreyel/mio.git
    system "cmake", ".", "-G", "Ninja", "-DKDUTILS_BUILD_TESTS=OFF", "-DKDUTILS_BUILD_EXAMPLES=OFF", *std_cmake_args, "-DHOMEBREW_ALLOW_FETCHCONTENT=ON"
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
