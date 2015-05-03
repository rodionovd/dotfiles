cask :v1 => 'dropdmg' do
	version '3.2.6'
	app 'DropDMG.app'
	sha256 '8e07cdeef08db9f32f150c76e3145ca1b8ed131f9d8132d739ee90126da9a88e'

	url 'https://c-command.com/downloads/DropDMG-3.2.6.dmg'
	name 'DropDMG'
	homepage 'https://c-command.com/dropdmg/'

	license :commercial
	depends_on :macos => '>= :snow_leopard'
	depends_on :arch => :intel
	
	zap :delete => [
		'~/Library/Automator/DropDMG.action',
		'~/Library/Automator/Expand Disk Image.action'
	]
end
