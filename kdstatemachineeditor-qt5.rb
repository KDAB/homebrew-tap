class KdstatemachineeditorQt5 < Formula
  desc "A Qt-based framework for creating Qt State Machine metacode using a graphical user interface"
  homepage "https://github.com/KDAB/KDStateMachineEditor"
  url "https://github.com/KDAB/KDStateMachineEditor/releases/download/v2.1.0/KDStateMachineEditor-2.1.0.tar.gz"
  sha256 "f1167d651f34c598e8b091a1224b970d15177ea51d9eb3c1e1a7f00caf8bc3cf"
  head "https://github.com/KDAB/KDStateMachineEditor.git"

  depends_on "qt@5" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "ninja" => :build

  depends_on "bison" => :build
  depends_on "graphviz"

  def install
    bison_bin = "#{HOMEBREW_PREFIX}/opt/bison/bin"
    ENV["PATH"] = "#{bison_bin}:#{ENV["PATH"]}"

    system "cmake", "-G", "Ninja", "-DBUILD_QT6=OFF", "-DKDSME_INTERNAL_GRAPHVIZ=OFF", ".", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
