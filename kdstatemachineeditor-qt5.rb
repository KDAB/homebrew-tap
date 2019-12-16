class KdstatemachineeditorQt5 < Formula
  desc "A Qt-based framework for creating Qt State Machine metacode using a graphical user interface"
  homepage "https://github.com/KDAB/KDStateMachineEditor"
  url "https://github.com/KDAB/KDStateMachineEditor/archive/v1.2.6.tar.gz"
  sha256 "c4426de9fb0ec65e15dadf82cb32a1a878681ca3acae996596ee79ecb8b43ca4"
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
