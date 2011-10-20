maintainer       "Filirom1"
maintainer_email "filirom1@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures haibu"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.5.0"

%w{ nodejs nodejs::npm git }.each do |cb|
  depends cb
end

recipe "haibu::default", "Installs and configures Haibu"
