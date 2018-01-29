class KdstatemachineeditorQt5 < Formula
  desc "A Qt-based framework for creating Qt State Machine metacode using a graphical user interface"
  homepage "https://github.com/KDAB/KDStateMachineEditor"
  url "https://github.com/KDAB/KDStateMachineEditor/archive/v1.2.2.tar.gz"
  sha256 "d616acc9cea6dc6ad4731d3a2fe12e19cf9ce6d3a59b4cd685cf719bd1b82637"
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
