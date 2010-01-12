require 'formula'

class Gdal <Formula
  url 'http://download.osgeo.org/gdal/gdal-1.7.2.tar.gz'
  homepage 'http://www.gdal.org/'
  md5 '05351f8cb61761ae579667e24a297fe6'

  depends_on 'libtiff'
  depends_on 'giflib'
  depends_on 'proj'
  depends_on 'geos'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make"
    system "make install"
  end
end
