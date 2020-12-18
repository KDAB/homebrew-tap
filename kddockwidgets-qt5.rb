class KddockwidgetsQt5 < Formula
  desc "A dock widget library implementing advanced functionalities missing in Qt"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v1.2.0/kddockwidgets-1.2.0.tar.gz"
  sha256 "b74657b6f2284c88917a239a522c63c7f06004c3915a9d5bf58c4a888251e3a3"
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
