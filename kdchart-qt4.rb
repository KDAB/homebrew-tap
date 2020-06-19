class KdchartQt4 < Formula
  desc "A Qt library for creating business and scientific charts"
  homepage "https://github.com/KDAB/KDChart"
  url "https://github.com/KDAB/KDChart/releases/download/kdchart-2.7.1/kdchart-2.7.1.tar.gz"
  sha256 "538185870286ff7786c8bf6f4a640a17ef5a61970699e1f236114f04ec722232"
  head "https://github.com/KDAB/KDChart.git"

  depends_on "qt" => "with-d-bus"

  def install
    system "touch", ".license.accepted"
    system "./configure.sh", "-shared",
                          "-release",
                          "-qmake", "/usr/local/bin/qmake",
                          "-prefix", "#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "make", "test"
  end
end
