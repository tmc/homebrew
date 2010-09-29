require 'formula'

#Once wxmac pointing to a 2.9 release we can use it for the wx dep ala:
#require Formula.path('wxmac')
#
#Until then specify our own dependency here
class WxPythonDependency <Formula
  url 'http://downloads.sourceforge.net/project/wxwindows/2.9.1/wxWidgets-2.9.1.tar.bz2'
  homepage 'http://www.wxwidgets.org'
  md5 '81c20d7b2ba31becb18e467dbe09be8f'
end

class WxPython <Formula
  head 'http://svn.wxwidgets.org/svn/wx/wxPython/trunk/',
    :using => StrictSubversionDownloadStrategy
  homepage 'http://www.wxpython.org'

  depends_on 'wxmac'

  def install
    wxdir = Pathname.getwd + 'wxWidgets'
    WxPythonDependency.new.brew { wxdir.install Dir['*'] }
    ENV['WXWIN'] = wxdir.to_s

    system "python", "build-wxpython.py", "--osx_cocoa", "--install", "--prefix=#{prefix}"
  end
end
