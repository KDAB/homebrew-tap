class KdstatemachineeditorQt6 < Formula
  desc "A Qt-based framework for creating Qt State Machine metacode using a graphical user interface"
  homepage "https://github.com/KDAB/KDStateMachineEditor"
  url "https://github.com/KDAB/KDStateMachineEditor/releases/download/v2.0.0/KDStateMachineEditor-v2.0.0.tar.gz"
  sha256 "6f258b5b7c6ad4287ee211ed4035f71c2101c18cd74e5b5a6d25158abe811daa"
  head "https://github.com/KDAB/KDStateMachineEditor.git"

  depends_on "qt@6" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "ninja" => :build

  depends_on "bison" => :build
  depends_on "graphviz"

  def install
    bison_bin = "#{HOMEBREW_PREFIX}/opt/bison/bin"
    ENV["PATH"] = "#{bison_bin}:#{ENV["PATH"]}"

    system "cmake", "-G", "Ninja", "-DKDSME_QT6=ON", "-DKDSME_INTERNAL_GRAPHVIZ=OFF", ".", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "ctest"
  end
end
