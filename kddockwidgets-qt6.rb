class KddockwidgetsQt6 < Formula
  desc "Advanced Dock Widget Framework for Qt6"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v1.6.0/kddockwidgets-1.6.0.tar.gz"
  sha256 "ab7503b96f4aa3ab76312c830dd268118169e3a367e40e9b6bfde66cb0bc4957"
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
