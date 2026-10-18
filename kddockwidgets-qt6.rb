class KddockwidgetsQt6 < Formula
  desc "Advanced Dock Widget Framework for Qt6"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v2.5.0/kddockwidgets-2.5.0.tar.gz"
  sha256 "4217e5d27fa576c5d78b684a6385d266a78edf13a0c2a0455b02a34d726286c3"
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
