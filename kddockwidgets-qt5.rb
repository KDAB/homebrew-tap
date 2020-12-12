class KddockwidgetsQt5 < Formula
  desc "A dock widget library implementing advanced functionalities missing in Qt"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v1.1.1/kddockwidgets-1.1.1.tar.gz"
  sha256 "2aa0d4d2f7d041d43de14118f5f1ef65111a78c90e570b8fd173c3ada90adc3f"
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
