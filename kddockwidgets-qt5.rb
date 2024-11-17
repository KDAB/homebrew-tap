class KddockwidgetsQt5 < Formula
  desc "Advanced Dock Widget Framework for Qt5"
  homepage "https://github.com/KDAB/KDDockWidgets"
  url "https://github.com/KDAB/KDDockWidgets/releases/download/v2.1.0/kddockwidgets-2.1.0.tar.gz"
  sha256 "cf3242b8fde8988b2661366b6a9597bcb67164074c4f31d03ec2999b475a25d7"
  head "https://github.com/KDAB/KDDockWidgets.git"

  depends_on "qt5" => "with-d-bus"
  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-DKDDockWidgets_NO_SPDLOG=ON", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
