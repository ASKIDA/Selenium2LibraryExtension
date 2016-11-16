from distutils.core import setup

setup(
	name = 'Selenium2LibraryExtension',
	package_dir  = {'' : 'src'},
	packages = ['Selenium2LibraryExtension', 'Selenium2LibraryExtension.keywords', 'Selenium2LibraryExtension.patches'],
	version = '1.1.0',
	description = 'This library was created as an expansion to Selenium2Library. It was initially created as a solution to specific test cases that required overhead (such as calling inline javascripts or using many steps for one action). It also features bugfixes.',
	author = 'Askida',
	author_email = 'olivier.verville@askida.com',
	url = 'https://github.com/axon-id/Selenium2LibraryExtension',
	download_url = 'https://github.com/axon-id/Selenium2LibraryExtension/tarball/1.1.0',
	keywords = ['Robot Framework', 'Robot-Framework', 'Selenium', 'WebDriver', 'Selenium2Library'],
	license = 'Apache License 2.0',
	classifiers = ['Framework :: Robot Framework', 'Programming Language :: Python :: 2.7', 'Programming Language :: Python :: 3.5'],
	install_requires = ['robotframework-selenium2library', 'robotframework >= 2.6.0', 'selenium >= 2.32.0'],
)