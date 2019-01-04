require 'formula'

class Antlr3 < Formula
  # Antlr4 is the current main, but some people may need Antlr3,
  # which has support for a C API.
  url "http://www.antlr3.org/download/antlr-3.5.2-complete.jar"
  version '3.5.2'
  homepage 'http://www.antlr.org/'
  sha256 '26ca659f47d77384f518cf2b6463892fcd4f0b0d4d8c0de2addf697e63e7326b'

  def install
    prefix.install "antlr-#{version}-complete.jar"

    (bin/"antlr3").write <<~EOS
      #!/bin/bash
      CLASSPATH="#{prefix}/antlr-#{version}-complete.jar:." exec java -jar #{prefix}/antlr-#{version}-complete.jar "$@"
    EOS

  end
end