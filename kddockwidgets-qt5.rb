class KddockwidgetsQt5 < Formula
  desc "Advanced Dock Widget Framework for Qt5"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v2.2.0/kddockwidgets-2.2.0.tar.gz"
  sha256 "02672f3ae864ed278e47602bebd8e5b1051a8d592678c829c171ce812d8469b2"
  head "https://github.com/KDAB/KDDockWidgets.git"

  depends_on "qt@5" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "ninja" => :build


  def install
    system "cmake", ".", "-G", "Ninja", "-DKDDockWidgets_NO_SPDLOG=ON", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
