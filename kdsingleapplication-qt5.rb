class KdsingleapplicationQt5 < Formula
  desc "Helper class for Qt5 single-instance policy applications"
  homepage "https://github.com/KDAB/KDSingleApplication"
  url "https://github.com/KDAB/KDSingleApplication/releases/download/v1.2.0/kdsingleapplication-1.2.0.tar.gz"
  sha256 "ff4ae6a4620beed1cdb3e6a9b78a17d7d1dae7139c3d4746d4856b7547d42c38"
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
