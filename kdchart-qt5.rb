class KdchartQt5 < Formula
  desc "A Qt library for creating business and scientific charts"
  homepage "https://github.com/KDAB/KDChart"
  url "https://github.com/KDAB/KDChart/releases/download/kdchart-2.7.0/kdchart-2.7.0.tar.gz"
  sha256 "3c4e37b75eb9f1f79d2920bc2b338594aebf0c0715943816262f580f0cabad79"
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
