class KddockwidgetsQt6 < Formula
  desc "Advanced Dock Widget Framework for Qt6"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v2.0.0/kddockwidgets-2.0.0.tar.gz"
  sha256 "10514846c8111812d575eaec701c7fef2d3a169d4ef2256fa50f52f70f508598"
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
