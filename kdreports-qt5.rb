class KdreportsQt5 < Formula
  desc "A Qt library for creating printable reports"
  homepage "https://github.com/KDAB/KDReports"
  url "https://build.opensuse.org/source/isv:KDAB/KDReports/kdreports-1.7.0.tar.gz"
  sha256 "cbaab8cd818015bf9750ca0c72b2101b7bc07bb67867125dd3cfa484782d716b"
  head "https://github.com/KDAB/KDReports.git"

  depends_on "qt5" => "with-d-bus"

  def install
    touch ".license.accepted"
    system "./configure.sh", "-shared",
                          "-release",
                          "-qmake", "/usr/local/opt/qt5/bin/qmake",
                          "-prefix", "#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
