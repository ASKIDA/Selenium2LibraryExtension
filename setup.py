from distutils.core import setup

setup(
	name = 'Selenium2LibraryExtension',
	packages = ['Selenium2LibraryExtension'],
	version = '1.0.0',
	description = 'This library was created as an expansion to Selenium2Library. It was initially created as a solution to specific test cases that required overhead (such as calling inline javascripts or using many steps for one action). It also features bugfixes.',
	author = 'Olivier Verville',
	author_email = 'olivier.verville@axon-id.com',
	url = 'https://github.com/axon-id/Selenium2LibraryExtension',
	download_url = 'https://github.com/axon-id/Selenium2LibraryExtension/tarball/1.0.0',
	keywords = ['Robot Framework', 'Robot-Framework', 'Selenium', 'WebDriver', 'Selenium2Library'],
	license = 'Apache License 2.0',
	classifiers = ['Framework :: Robot Framework']
)