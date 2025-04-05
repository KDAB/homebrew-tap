class KddockwidgetsQt6 < Formula
  desc "Advanced Dock Widget Framework for Qt6"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v2.2.3/kddockwidgets-2.2.3.tar.gz"
  sha256 "b8529755b2d54205341766ae168e83177c6120660539f9afba71af6bca4b81ec"
  head "https://github.com/KDAB/KDDockWidgets.git"

  depends_on "qt@6" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "ninja" => :build

  def install
    system "cmake", ".", "-G", "Ninja", "-DKDDockWidgets_NO_SPDLOG=ON", "-DKDDockWidgets_QT6=True", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
