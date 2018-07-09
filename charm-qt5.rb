class CharmQt5 < Formula
  desc "A Qt-based Cross-Platform Time Tracker"
  homepage "https://github.com/KDAB/Charm"
  url "https://github.com/KDAB/Charm/archive/1.12.0.tar.gz"
  sha256 "82e1b2356bd5a29f4b6b19b6c7dc7a8b0ce32574a5999b617647743e012f52b6"
  head "https://github.com/KDAB/Charm.git"

  depends_on "qt5" => "with-d-bus"
  depends_on "qtkeychain"
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
