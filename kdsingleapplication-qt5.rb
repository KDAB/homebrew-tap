class KdsingleapplicationQt5 < Formula
  desc "Helper class for Qt5 single-instance policy applications"
  homepage "https://github.com/KDAB/KDSingleApplication"
  url "https://github.com/KDAB/KDSingleApplication/releases/download/v1.0.0/kdsingleapplication-1.0.0.tar.gz"
  sha256 "c92355dc10f3ebd39363458458fb5bdd9662e080cf77d91f0437763c4d936520"
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
