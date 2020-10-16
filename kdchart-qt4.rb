class KdchartQt4 < Formula
  desc "A Qt library for creating business and scientific charts"
  homepage "https://github.com/KDAB/KDChart"
  url "https://github.com/KDAB/KDChart/releases/download/kdchart-2.7.2/kdchart-2.7.2.tar.gz"
  sha256 "6f78518db4a649ff4dccd6bbcd2efce59a2611c2dba3e92d1b9aaa444fa9a6d5"
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
