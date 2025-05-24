class KddockwidgetsQt5 < Formula
  desc "Advanced Dock Widget Framework for Qt5"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v2.2.5/kddockwidgets-2.2.5.tar.gz"
  sha256 "1c202d03a0c7018aebcb249b09122d846b34298d88d0bc247a601f48c7513c89"
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
