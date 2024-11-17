class CharmQt4 < Formula
  desc "A Qt-based Cross-Platform Time Tracker"
  homepage "https://github.com/KDAB/Charm"
  url "https://github.com/KDAB/Charm/archive/1.11.4.tar.gz"
  sha256 "24f31c76e30a56e87647a8aafa87e448e86e23e9e796c225b0e824a40dfb663b"
  head "https://github.com/KDAB/Charm.git"

  depends_on "qt" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "ninja" => :build


  def install
    system "cmake", ".", "-G", "Ninja", "-DCharm_VERSION=1.10.0", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
