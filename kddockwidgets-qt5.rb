class KddockwidgetsQt5 < Formula
  desc "Advanced Dock Widget Framework for Qt5"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v2.2.4/kddockwidgets-2.2.4.tar.gz"
  sha256 "a1cf55a3cf267108ee495de8df9038c67f61da5ca324059cb32543d69877524e"
  head "https://github.com/KDAB/KDDockWidgets.git"

  depends_on "qt@5" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "ninja" => :build


  def install
    system "cmake", ".", "-G", "Ninja", "-DKDDockWidgets_NO_SPDLOG=ON", "-DKDDockWidgets_QT6=OFF", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
