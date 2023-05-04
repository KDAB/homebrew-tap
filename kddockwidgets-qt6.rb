class KddockwidgetsQt6 < Formula
  desc "Advanced Dock Widget Framework for Qt6"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v1.7.0/kddockwidgets-1.7.0.tar.gz"
  sha256 "6ee03e5b788bbcc20abaf7fcc468e27284f543e80fe6b1d4fb8ce0de7c7b4c49"
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
