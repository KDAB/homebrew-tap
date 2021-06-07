class KddockwidgetsQt6 < Formula
  desc "Advanced Dock Widget Framework for Qt6"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v1.3.1/kddockwidgets-1.3.1.tar.gz"
  sha256 "5b1a532590ce4bf01147450f946d7460754d0424487ce4eb4f563d1b8e8c4449"
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
