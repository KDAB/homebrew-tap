class KdstatemachineeditorQt6 < Formula
  desc "A Qt-based framework for creating Qt State Machine metacode using a graphical user interface"
  homepage "https://github.com/KDAB/KDStateMachineEditor"
  url "https://github.com/KDAB/KDStateMachineEditor/releases/download/v2.2.0/KDStateMachineEditor-2.2.0.tar.gz"
  sha256 "2fb961da3277c8d8884352aaed5ded601264944f3972e4180fa65de8714347df"
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
