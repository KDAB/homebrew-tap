class KdstatemachineeditorQt5 < Formula
  desc "A Qt-based framework for creating Qt State Machine metacode using a graphical user interface"
  homepage "https://github.com/KDAB/KDStateMachineEditor"
  url "https://github.com/KDAB/KDStateMachineEditor/archive/v1.2.3.tar.gz"
  sha256 "929f30fff2ae922f6b617c3e361e78880d5bb1099d2e97d85be6114bc40a1745"
  head "https://github.com/KDAB/KDStateMachineEditor.git"

  depends_on "qt5" => "with-d-bus"
  depends_on "graphviz"
  depends_on "cmake" => :build

  patch do
    url "https://raw.githubusercontent.com/KDAB/homebrew-tap/master/formula-patches/kdstatemachineeditor/qpointheader-fix.diff"
    sha256 "cbaaf171165d86f3c90aad032cacd8ae1da1bb364407e5eb8fa2c604ca69de21"
  end

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
