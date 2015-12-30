class CharmQt4 < Formula
  desc "A Qt-based Cross-Platform Time Tracker"
  homepage "https://github.com/KDAB/Charm"
  url "https://github.com/KDAB/Charm/archive/1.10.0.tar.gz"
  sha256 "063b13eabee101445e18ea4f9088dd5b87c4e47aa022b0f0c356b8df80ae3a1a"
  head "https://github.com/KDAB/Charm.git"

  depends_on "qt"
  depends_on "cmake" => :build

  patch :p1, :DATA

  def install
    system "cmake", ".", "-DCharm_VERSION=1.10.0", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end

__END__
diff -ru Charm-1.10.0.ori/CMakeLists.txt Charm-1.10.0.new/CMakeLists.txt
--- Charm-1.10.0.ori/CMakeLists.txt	2015-10-02 09:50:49.000000000 +0200
+++ Charm-1.10.0.new/CMakeLists.txt	2015-12-29 12:54:53.000000000 +0100
@@ -28,7 +28,7 @@
     SET( CMAKE_BUILD_TYPE "Release" CACHE STRING "" FORCE )
 ENDIF()

-IF( APPLE AND CMAKE_INSTALL_PREFIX MATCHES "/usr/local" )
+IF( APPLE AND CMAKE_INSTALL_PREFIX STREQUAL "/usr/local" )
     SET( CMAKE_INSTALL_PREFIX "/Applications" )
 ENDIF()

