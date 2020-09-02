class KddockwidgetsQt5 < Formula
  desc "A dock widget library implementing advanced functionalities missing in Qt"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v1.0.0/kddockwidgets-1.0.0.tar.gz"
  sha256 "54d2377cf86375b104f93ae12c350f1aea86603275f28705033ec1e7ff98a1a4"
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
