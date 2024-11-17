class KdstatemachineeditorQt6 < Formula
  desc "A Qt-based framework for creating Qt State Machine metacode using a graphical user interface"
  homepage "https://github.com/KDAB/KDStateMachineEditor"
  url "https://github.com/KDAB/KDStateMachineEditor/archive/4ac468cb3576b44a74c69567120f043613b1a8a9.tar.gz"
  sha256 "0cdb04c97d1fb8579ab5ab4ee168b93403c6d9d576099d5cd87600be062cd8c5"
  version "2.0.0-beta1"
  head "https://github.com/KDAB/KDStateMachineEditor.git"

  depends_on "qt6" => "with-d-bus"
  depends_on "cmake" => :build
  depends_on "bison" => :build
  depends_on "graphviz"

  def install
    bison_bin = "#{HOMEBREW_PREFIX}/opt/bison/bin"
    ENV["PATH"] = "#{bison_bin}:#{ENV["PATH"]}"

    system "cmake", "-DBUILD_QT6=ON", "-DWITH_INTERNAL_GRAPHVIZ=OFF", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
