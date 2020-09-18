class KdstatemachineeditorQt5 < Formula
  desc "A Qt-based framework for creating Qt State Machine metacode using a graphical user interface"
  homepage "https://github.com/KDAB/KDStateMachineEditor"
  url "https://github.com/KDAB/KDStateMachineEditor/archive/v1.2.8.tar.gz"
  sha256 "cbb3fcec7b5c6d16354aeb6c376c67a6ced32fce7bd937da0d4f591373acd374"
  head "https://github.com/KDAB/KDStateMachineEditor.git"

  depends_on "qt5" => "with-d-bus"
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
