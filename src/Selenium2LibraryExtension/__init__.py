# -*- coding: utf-8 -*-

from Selenium2Library import Selenium2Library
from Selenium2Library.utils import LibraryListener
from Selenium2LibraryExtension.patches import _patches
from Selenium2LibraryExtension.keywords import _keywords

class Selenium2LibraryExtension(Selenium2Library, _patches, _keywords):
	"""*Selenium2LibraryExtension*\n
	---
	Created to provide functionalities that either weren't available in the original library, or required overhead in order to be achieved.\n
	Also provides major bugfixes. This library is meant to give a control closer to the level of control you would get from using Selenium's
	API directly.

	= New Locators =

	Selenium2LibraryExtension implements new element location strategies on top of the original location strategies from Selenium2Library. For
	more information about locators, see Selenium2Library's [http://robotframework.org/Selenium2Library/doc/Selenium2Library.html#Introduction|locator documentation].

	| =locator= | =Description= | =Example of Usage= |
	| input | retrieves the currently active input element. the argument always is `current` | input=current |
	| meta_name | retrieves the meta element(s) with the specified name | meta_name=description |
	| last_tag | retrieves the last element with the specified tag | last_tag=div |
	| first_tag | retrieves the first element with the specified tag | first_tag=div |"""

	ROBOT_LIBRARY_DOC_FORMAT = 'ROBOT'
	ROBOT_LIBRARY_SCOPE = 'GLOBAL'
	__version__ = '1.1.0'

	def __init__(self, timeout=10.0, implicit_wait=0.0, run_on_failure='Capture Page Screenshot', screenshot_root_directory=None):
		"""Selenium2LibraryExtension can be imported with the same arguments as Selenium2Library. See the
		[http://robotframework.org/Selenium2Library/doc/Selenium2Library.html#Importing|importing] documentation for more details."""

		for base in Selenium2Library.__bases__:
			base.__init__(self)

		self.screenshot_root_directory = screenshot_root_directory
		self.set_selenium_timeout(timeout)
		self.set_selenium_implicit_wait(implicit_wait)
		self.register_keyword_to_run_on_failure(run_on_failure)
		self.ROBOT_LIBRARY_LISTENER = LibraryListener()

		# register new locators
		self.add_location_strategy('input', self._locator_find_active_element, persist=True)
		self.add_location_strategy('meta_name', self._locator_find_by_meta_name, persist=True)
		self.add_location_strategy('last_tag', self._locator_find_last_by_tag, persist=True)
		self.add_location_strategy('first_tag', self._locator_find_first_by_tag, persist=True)

	##############################################################################################################
	##																											##
	## LOCATORS																									##
	##																											##
	##############################################################################################################

	def _locator_find_active_element(self, browser, criteria, tag, constraints):
		return browser.switch_to.active_element

	def _locator_find_by_meta_name(self, browser, criteria, tag, constraints):
		return browser.execute_script("return $('meta[name=%s]');" % criteria)

	def _locator_find_last_by_tag(self, browser, criteria, tag, constraints):
		return browser.execute_script("return $('%s:last');" % criteria)

	def _locator_find_first_by_tag(self, browser, criteria, tag, constraints):
		return browser.execute_script("return $('%s:first');" % criteria)