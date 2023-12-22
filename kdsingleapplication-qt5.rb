class KdsingleapplicationQt5 < Formula
  desc "Helper class for Qt5 single-instance policy applications"
  homepage "https://github.com/KDAB/KDSingleApplication"
  url "https://github.com/KDAB/KDSingleApplication/releases/download/v1.1.0/kdsingleapplication-1.1.0.tar.gz"
  sha256 "31029fffa4873e2769c555668e8edaa6bd5721edbc445bff5e66cc6af3b9ed78"
  head "https://github.com/KDAB/KDSingleApplication.git"

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
