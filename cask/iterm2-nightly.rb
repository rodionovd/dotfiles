cask :v1 => 'iterm2-nightly' do
  version :latest
  sha256 :no_check

  url 'https://www.iterm2.com/nightly/latest'
  name 'iTerm2'
  name 'iTerm 2'
  homepage 'https://www.iterm2.com/'
  license :gpl

  appcast 'https://iterm2.com/appcasts/nightly.xml'

  app 'iTerm.app'
  zap :delete => [
      '~/Library/Preferences/com.googlecode.iterm2.plist',
  ]
end
