class KdchartQt5 < Formula
  desc "A Qt library for creating business and scientific charts"
  homepage "https://github.com/KDAB/KDChart"
  url "https://github.com/KDAB/KDChart/releases/download/kdchart-2.8.0/kdchart-2.8.0.tar.gz"
  sha256 "91ee7cf1c0de090fbd47d800a5dd38f11673e053719043777fcab64008f3b9fe"
  head "https://github.com/KDAB/KDChart.git"

  depends_on "qt5" => "with-d-bus"

  def install
    system "touch", ".license.accepted"
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
