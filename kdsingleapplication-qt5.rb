class KdsingleapplicationQt5 < Formula
  desc "Helper class for Qt5 single-instance policy applications"
  homepage "https://github.com/KDAB/KDSingleApplication"
  url "https://github.com/KDAB/KDSingleApplication/releases/download/v1.2.1/kdsingleapplication-1.2.1.tar.gz"
  sha256 "e3254ce9dc5ecf6d61ef83264bc61d486a307f0e3c9ed1bb2176f068cdbcbe09"
  head "https://github.com/KDAB/KDSingleApplication.git"

  depends_on "qt@5" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "ninja" => :build


  def install
    system "cmake", ".", "-G", "Ninja", "-DKDSingleApplication_QT6=OFF", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
