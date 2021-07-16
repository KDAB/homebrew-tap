class KddockwidgetsQt6 < Formula
  desc "Advanced Dock Widget Framework for Qt6"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v1.4.0/kddockwidgets-1.4.0.tar.gz"
  sha256 "e8cc52ee49c6aa8fe4caae3d3a58370fc6dda9d7936621c46a514a9726b5177d"
  head "https://github.com/KDAB/KDDockWidgets.git"

  depends_on "qt6" => "with-d-bus"
  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-DKDDockWidgets_QT6=True", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
