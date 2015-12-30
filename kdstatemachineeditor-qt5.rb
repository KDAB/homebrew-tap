class KdstatemachineeditorQt5 < Formula
  desc "A Qt-based framework for creating Qt State Machine metacode using a graphical user interface"
  homepage "https://github.com/KDAB/KDStateMachineEditor"
  url "https://github.com/KDAB/KDStateMachineEditor/archive/v1.0.0.tar.gz"
  sha256 "ba60e9407c4d21aa8b2ae061d6281f9ded80ab806b5003b1a49367de24034d7f"
  head "https://github.com/KDAB/KDStateMachineEditor.git"

  depends_on "qt5"
  depends_on "graphviz"
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
