class KddockwidgetsQt5 < Formula
  desc "Advanced Dock Widget Framework for Qt5"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v2.3.0/kddockwidgets-2.3.0.tar.gz"
  sha256 "843baf9e1812c1ab82fd81d85b57cbc0d29bb43245efeb2539039780004b1056"
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
