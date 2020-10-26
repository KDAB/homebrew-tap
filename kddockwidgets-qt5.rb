class KddockwidgetsQt5 < Formula
  desc "A dock widget library implementing advanced functionalities missing in Qt"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v1.1.0/kddockwidgets-1.1.0.tar.gz"
  sha256 "f1349a34ced2ec5c8daec25fe09cb8593a5a3cb55bea6542b8f6c1f4e863d9a4"
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
