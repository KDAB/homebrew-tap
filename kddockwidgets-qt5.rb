class KddockwidgetsQt5 < Formula
  desc "Advanced Dock Widget Framework for Qt"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v1.3.0/kddockwidgets-1.3.0.tar.gz"
  sha256 "09149e5065dc07a528e468cecf2d7da766476b7cadd820afaad46a3161f2e934"
  head "https://github.com/KDAB/KDDockWidgets.git"

  depends_on "qt5" => "with-d-bus"
  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
