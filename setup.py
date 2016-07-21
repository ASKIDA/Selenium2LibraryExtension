from distutils.core import setup

setup(
	name = 'Selenium2LibraryExtension',
	packages = ['Selenium2LibraryExtension'],
	version = '5.1.1',
	description = 'This library was created as an expansion to Selenium2Library. It was initially created as a solution to specific test cases that required overhead (such as calling inline javascripts or using many steps for one action). It also features bugfixes.',
	author = 'Olivier Verville',
	author_email = 'olivier.verville@axon-id.com',
	url = 'https://github.com/axon-id/Selenium2LibraryExtension',
	keywords = ['Robot Framework', 'Robot-Framework', 'Selenium', 'WebDriver', 'Selenium2Library'],
	classifiers = ['Framework :: Robot Framework']
)