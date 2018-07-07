class CharmQt5 < Formula
  desc "A Qt-based Cross-Platform Time Tracker"
  homepage "https://github.com/KDAB/Charm"
  url "https://github.com/KDAB/Charm/archive/1.12.0rc2.tar.gz"
  sha256 "7c6879bc474d33d66675db9a23e9661ba0f329cd3bf9a23ce45d565383730deb"
  head "https://github.com/KDAB/Charm.git"

  depends_on "qt5" => "with-d-bus"
  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-DCharm_VERSION=1.12.0rc2", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
