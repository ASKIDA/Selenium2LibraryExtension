# -*- coding: utf-8 -*-

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains

class _keywords():

	def __init__(self):
	
		pass

	##################################################################################################
	## Wait Until Element Has Focus 																##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 6th 2016																	##
	##################################################################################################
	def wait_until_element_has_focus(self, locator, timeout=None):
		"""Waits until the element identified by `locator` has focus.
		You might rather want to use `Element Focus Should Be Set`

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| timeout | maximum time to wait before the function throws an element not found error (default=None) | 5s |"""

		self._info("Waiting for focus on '%s'" % (locator))
		self._wait_until_no_error(timeout, self._check_element_focus_exp, True, locator, timeout)

	##################################################################################################
	## Wait Until Element Does Not Have Focus 														##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 6th 2016																	##
	##################################################################################################
	def wait_until_element_does_not_have_focus(self, locator, timeout=None):
		"""Waits until the element identified by `locator` doesn't have focus.
		You might rather want to use `Element Focus Should Not Be Set`

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| timeout | maximum time to wait before the function throws an element not found error (default=None) | 5s |"""

		self._info("Waiting until '%s' does not have focus" % (locator))
		self._wait_until_no_error(timeout, self._check_element_focus_exp, False, locator, timeout)

	##################################################################################################
	## Wait Until Element Value Is																	##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 7th 2016																	##
	##################################################################################################
	def wait_until_element_value_is(self, locator, expected, strip=False, timeout=None):
		"""Waits until the element identified by `locator` value is exactly the
		expected value. You might want to use `Element Value Should Be` instead.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| expected | expected value | My Name Is Slim Shady |
		| strip | boolean, determines whether it should strip the value of the field before comparison | ${True} / ${False} |
		| timeout | maximum time to wait before the function throws an element not found error (default=None) | 5s |"""

		self._info("Waiting for '%s' value to be '%s'" % (locator, expected))
		self._wait_until_no_error(timeout, self._check_element_value_exp, False, locator, expected, strip, timeout)

	##################################################################################################
	## Wait Until Element Value Contains															##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 7th 2016																	##
	##################################################################################################
	def wait_until_element_value_contains(self, locator, expected, timeout=None):
		"""Waits until the element identified by `locator` contains
		the expected value. You might want to use `Element Value Should Contain` instead.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| expected | expected value | Slim Shady |
		| timeout | maximum time to wait before the function throws an element not found error (default=None) | 5s |"""

		self._info("Waiting for '%s' value to contain '%s'" % (locator, expected))
		self._wait_until_no_error(timeout, self._check_element_value_exp, True, locator, expected, False, timeout)

	##################################################################################################
	## Set Element Focus																			##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 7th 2016																	##
	##################################################################################################
	def set_element_focus(self, locator):
		"""Sets focus on the element identified by `locator`. Should
		be used with elements meant to have focus only, such as
		text fields. This keywords also waits for the focus to be
		active by calling the `Wait Until Element Has Focus` keyword.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |"""

		self._info("Setting focus on element '%s'" % (locator))
		
		element = self._element_find(locator, True, True)
		element.send_keys(Keys.NULL)

		self._wait_until_no_error(None, self._check_element_focus, True, locator)

	##################################################################################################
	## Clear Input Field																			##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 7th 2016																	##
	##################################################################################################
	def clear_input_field(self, locator, method=0):
		"""Clears the text field identified by `locator`

		The element.clear() method doesn't seem to work properly on
		all browsers, so this keyword was created to offer alternatives.

		The `method` argument defines the method it should use in order
		to clear the target field.

		0 = Uses the selenium method by doing element.clear \n
		1 = Sets focus on the field and presses CTRL + A, and then DELETE \n
		2 = Repeatedly presses BACKSPACE until the field is empty

		This keyword, when using a method other than '2' does not validate it
		successfully cleared the field, you should handle this verification by yourself.
		When using the method '2', it presses delete until the field's value is empty.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| method | the clearing method that should be used | no example provided |"""

		element = self._element_find(locator, True, True)
		
		if (int(method) == 0):

			self._info("Clearing input on element '%s'" % (locator))
			element.clear()

		elif (int(method) == 1):

			self._info("Clearing input on element '%s' by pressing 'CTRL + A + DELETE'" % (locator))
			element.send_keys(Keys.CONTROL + 'a')
			element.send_keys(Keys.DELETE)

		elif (int(method) == 2):

			self._info("Clearing input on element '%s' by repeatedly pressing BACKSPACE" % (locator))
			while (len(element.get_attribute('value')) != 0):

				element.send_keys(Keys.BACKSPACE)

		else: element.clear()

	##################################################################################################
	## Element Text Color Should Be																	##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 8th 2016																	##
	##################################################################################################
	def element_text_color_should_be(self, locator, expected):
		"""Verifies the element identified by `locator` has the expected
		text color (it verifies the CSS attribute color). Color should be in
		RGBA format.

		Example of rgba format: rgba(RED, GREEN, BLUE, ALPHA)

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| expected | expected color | rgba(0, 128, 0, 1) |"""

		self._info("Verifying element '%s' has text color '%s'" % (locator, expected))
		self._check_element_css_value(locator, 'color', expected)

	##################################################################################################
	## Element Background Color Should Be															##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 8th 2016																	##
	##################################################################################################
	def element_background_color_should_be(self, locator, expected):
		"""Verifies the element identified by `locator` has the expected
		background color (it verifies the CSS attribute background-color). Color should
		be in RGBA format.

		Example of rgba format: rgba(RED, GREEN, BLUE, ALPHA)

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| expected | expected color | rgba(0, 128, 0, 1) |"""

		self._info("Verifying element '%s' has background color '%s'" % (locator, expected))
		self._check_element_css_value(locator, 'background-color', expected)

	##################################################################################################
	## Element Width Should Be																		##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 8th 2016																	##
	##################################################################################################
	def element_width_should_be(self, locator, expected):
		"""Verifies the element identified by `locator` has the expected
		width. Expected width should be in pixels.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| expected | expected width | 800 |"""

		self._info("Verifying element '%s' width is '%s'" % (locator, expected))
		self._check_element_size(locator, 'width', expected)

	##################################################################################################
	## Element Height Should Be																		##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 8th 2016																	##
	##################################################################################################
	def element_height_should_be(self, locator, expected):
		"""Verifies the element identified by `locator` has the expected
		height. Expected height should be in pixels.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| expected | expected height | 600 |"""

		self._info("Verifying element '%s' height is '%s'" % (locator, expected))
		self._check_element_size(locator, 'height', expected)

	##################################################################################################
	## Element Value Should Be																		##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 9th 2016																	##
	##################################################################################################
	def element_value_should_be(self, locator, expected, strip=False):
		"""Verifies the element identified by `locator` has the expected value.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| expected | expected value | My Name Is Slim Shady |
		| strip | Boolean, determines whether it should strip the field's value before comparison or not | ${True} / ${False} |"""

		self._info("Verifying element '%s' value is '%s'" % (locator, expected))
		
		element = self._element_find(locator, True, True)
		value = element.get_attribute('value')

		if (strip):
			value = value.strip()
		
		if str(value) == expected:
			return
		
		else:
			raise AssertionError("Element '%s' value was not '%s', it was '%s'" % (locator, expected, value))

	##################################################################################################
	## Element Value Should Not Be																	##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 9th 2016																	##
	##################################################################################################
	def element_value_should_not_be(self, locator, value, strip=False):
		"""Verifies the element identified by `locator` is not the specified value.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| value | value it should not be | My Name Is Slim Shady |
		| strip | Boolean, determines whether it should strip the field's value before comparison or not | ${True} / ${False} |"""

		self._info("Verifying element '%s' value is not '%s'" % (locator, value))
		
		element = self._element_find(locator, True, True)
		elem_value = str(element.get_attribute('value'))

		if (strip):
			elem_value = elem_value.strip()
		
		if elem_value == value:
			raise AssertionError("Value was '%s' for element '%s' while it shouldn't have" % (elem_value, locator))

	##################################################################################################
	## Element Value Should Contain																	##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 9th 2016																	##
	##################################################################################################
	def element_value_should_contain(self, locator, expected):
		"""Verifies the element identified by `locator` contains the expected value.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| expected | expected value | Slim Shady |"""

		self._info("Verifying element '%s' value contains '%s'" % (locator, expected))
		
		element = self._element_find(locator, True, True)
		value = str(element.get_attribute('value'))
		
		if expected in value:
			return
		
		else:
			raise AssertionError("Value '%s' did not appear in element '%s'. It's value was '%s'" % (expected, locator, value))

	##################################################################################################
	## Element Value Should Not Contain																##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 9th 2016																	##
	##################################################################################################
	def element_value_should_not_contain(self, locator, value):
		"""Verifies the element identified by `locator` does not contain the specified value.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| value | value it should not contain | Slim Shady |"""

		self._info("Verifying element '%s' value does not contain '%s'" % (locator, value))
		
		element = self._element_find(locator, True, True)
		elem_value = str(element.get_attribute('value'))
		
		if value in elem_value:
			raise AssertionError("Value '%s' was found in element '%s' while it shouldn't have" % (value, locator))
			
	##################################################################################################
	## Element Focus Should Be Set																	##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 24th 2016																	##
	##################################################################################################
	def element_focus_should_be_set(self, locator):
		"""Verifies the element identified by `locator` has focus.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |"""

		self._info("Verifying element '%s' focus is set" % locator)
		self._check_element_focus(True, locator)

	##################################################################################################
	## Element Focus Should Not Be Set																##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 24th 2016																	##
	##################################################################################################
	def element_focus_should_not_be_set(self, locator):
		"""Verifies the element identified by `locator` does not have focus.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |"""

		self._info("Verifying element '%s' focus is not set" % locator)
		self._check_element_focus(False, locator)

	##################################################################################################
	## Element Css Attribute Should Be																##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 24th 2016																	##
	##################################################################################################
	def element_css_attribute_should_be(self, locator, prop, expected):
		"""Verifies the element identified by `locator` has the expected
		value for the targeted `prop`.

		| *Argument* | *Description* | *Example* |
		| locator | Selenium 2 element locator | id=my_id |
		| prop | targeted css attribute | background-color |
		| expected | expected value | rgba(0, 128, 0, 1) |"""

		self._info("Verifying element '%s' has css attribute '%s' with a value of '%s'" % (locator, prop, expected))
		self._check_element_css_value(locator, prop, expected)

	##################################################################################################
	## Wait Until Page Contains Elements															##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 24th 2016																	##
	##################################################################################################
	def wait_until_page_contains_elements(self, timeout, *locators):
		"""This is a copy of `Wait Until Page Contains Element` but it allows
		multiple arguments in order to wait for more than one element.
		
		| *Argument* | *Description* | *Example* |
		| timeout | maximum time to wait, if set to ${None} it will use Selenium's default timeout | 5s |
		| *locators | Selenium 2 element locator(s) | id=MyId |"""
		
		self._wait_until_no_error(timeout, self._wait_for_elements, locators)

	##################################################################################################
	## Wait Until Page Contains One Of These Elements												##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		May 24th 2016																	##
	##################################################################################################
	def wait_until_page_contains_one_of_these_elements(self, timeout, *locators):
		"""Waits until at least one of the specified elements is found.
		
		| *Argument* | *Description* | *Example* |
		| timeout | maximum time to wait, if set to ${None} it will use Selenium's default timeout | 5s |
		| *locators | Selenium 2 element locator(s) | id=MyId |"""
		
		self._wait_until_no_error(timeout, self._wait_for_at_least_one_element, locators)

	##################################################################################################
	## Wait Until Page Does Not Contain These Elements												##
	##																								##
	## Author:		Olivier Verville																##
	## Date:		June 29th 2016																	##
	##################################################################################################
	def wait_until_page_does_not_contain_these_elements(self, timeout, *locators):
		"""Waits until all of the specified elements are not found on the page.

		| *Argument* | *Description* | *Example* |
		| timeout | maximum time to wait, if set to ${None} it will use Selenium's default timeout | 5s |
		| *locators | Selenium 2 element locator(s) | id=MyId |"""

		self._wait_until_no_error(timeout, self._wait_for_elements_to_go_away, locators)

	##############################################################################################
	## Tap Key																					##
	##																							##
	## Author:				Olivier Verville													##
	## Date:				June 28th 2016														##
	##############################################################################################
	def tap_key(self, key, complementKey=None) :
		"""Presses the specified `key`. The `complementKey` defines the key to hold
		when pressing the specified `key`. For example, you could use ${VK_TAB} as `key` and
		use ${VK_SHIFT} as `complementKey' in order to press Shift + Tab (back tab)

		| =Argument= | =Description= | =Example= |
		| key | the key to press | ${VK_F4} |
		| complementKey | the key to hold while pressing the key passed in previous argument | ${VK_ALT} |"""

		driver = self._current_browser()

		if (complementKey is not None) :
			ActionChains(driver).key_down(complementKey).send_keys(key).key_up(complementKey).perform()

		else :
			ActionChains(driver).send_keys(key).perform()

	##############################################################################################
	## Wait Until Element Is Clickable															##
	##																							##
	## Author:				Olivier Verville													##
	## Date:				July 13th 2016														##
	##############################################################################################
	def wait_until_element_is_clickable(self, locator, timeout=None):
		"""Clicks the element specified by `locator` until the operation succeeds. This should be
		used with buttons that are generated in real-time and that don't have their click handling available
		immediately. This keyword avoids unclickable element exceptions.

		| =Argument= | =Description= | =Example= |
		| locator | Selenium 2 element locator(s) | id=MyId |
		| timeout | maximum time to wait, if set to ${None} it will use Selenium's default timeout | 5s |"""

		self._wait_until_no_error(timeout, self._wait_for_click_to_succeed, locator)
			
	################################################################################################################################################################
	## |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||##
	## HELPER METHODS ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||##
	## |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||##
	################################################################################################################################################################

	##############################
	## Checks an element focus	##
	##############################
	def _check_element_focus_exp(self, set, locator, timeout=None):
			
		if set:
			element = self._element_find(locator, True, False)
			if not element: return "Element locator '%s' did not match any elements after %s" % (locator, self._format_timeout(timeout))
			
			driver = self._current_browser()
			if element == driver.switch_to.active_element: return
			else: return "Element '%s' did not get focus after %s" % (locator, self._format_timeout(timeout))
			
		else:
			element = self._element_find(locator, True, False)
			if not element: return "Element locator '%s' did not match any elements after %s" % (locator, self._format_timeout(timeout))
			
			driver = self._current_browser()
			if element != driver.switch_to.active_element: return
			else: return "Element '%s' still had focus after %s while it shouldn't have" % (locator, self._format_timeout(timeout))

	##################################
	## Checks an element's value	##
	##################################
	def _check_element_value_exp(self, partial, locator, expected, strip=False, timeout=None):
	
		if partial:
			element = self._element_find(locator, True, False)
			if not element: return "Element locator '%s' did not match any elements after %s" % (locator, self._format_timeout(timeout))
			
			value = str(element.get_attribute('value'))

			if (strip):
				value = value.strip()

			if expected in value: return
			else: return "Value '%s' did not appear in %s to element '%s'. It's value was '%s'." % (expected, self._format_timeout(timeout), locator, value)
		
		else:
			element = self._element_find(locator, True, False)
			if not element: return "Element locator '%s' did not match any elements after %s" % (locator, self._format_timeout(timeout))

			value = element.get_attribute('value')

			if (strip):
				value = value.strip()

			if str(value) == expected: return
			else: return "Element '%s' value was not %s after %s" % (locator, expected, self._format_timeout(timeout))

	##############################
	## Checks an element focus	##
	##############################
	def _check_element_focus(self, set, locator):
			
		if set:
			element = self._element_find(locator, True, True)
			driver = self._current_browser()
			if element == driver.switch_to.active_element: return
			else: raise AssertionError("Element '%s' did not have focus while it should have" % locator)
			
		else:
			element = self._element_find(locator, True, True)
			driver = self._current_browser()
			if element != driver.switch_to.active_element: return
			else: raise AssertionError("Element '%s' had focus while it shouldn't have" % locator)

	##########################################
	## Checks the specified css attribute	##
	##########################################
	def _check_element_css_value(self, locator, prop, expected):
	
		element = self._element_find(locator, True, True)
		
		value = element.value_of_css_property(prop)
		if (value != expected):
			raise AssertionError("Element locator '%s' css property '%s' had a value of '%s' while it should have been '%s'" % (locator, prop, value, expected))

	######################################
	## Checks element size attribute	##
	######################################
	def _check_element_size(self, locator, type, expected):
	
		element = self._element_find(locator, True, True)
		
		size = str(element.size.get(type))
		if size != expected:
			raise AssertionError("The %s of element '%s' should have been '%s' but in fact it was '%s'" % (type, locator, expected, size))
		
	##################################
	## Waits for multiple elements	##
	##################################
	def _wait_for_elements(self, locators):
		
		for locator in locators:
			
			element = self._element_find(locator, True, False)
			if not element: return "Element '%s' couldn't be found" % locator
			
	##################################################
	## Waits for at least one of the given elements	##
	##################################################
	def _wait_for_at_least_one_element(self, locators):
		
		for locator in locators:
			
			element = self._element_find(locator, True, False)
			if element is not None: return
			
		return "Couldn't find any of the expected elements from '%s'" % str(locators)
	
	##################################################################
	## Simpler implementation of Wait Until Page Contains Element	##
	##################################################################
	def _wait_for_element(self, locator):
		
		element = self._element_find(locator, True, False)
		if not element: return "Element '%s' couldn't be found" % locator
	
	########################################################################
	## Simpler implementation of Wait Until Page Does Not Contain Element ##
	########################################################################
	def _wait_for_element_to_go_away(self, locator):
		
		element = self._element_find(locator, True, False)
		if element is not None: return "Element '%s' shouldn't have been there" % locator

	###################################################
	## Waits for multiple elements to not be present ##
	###################################################
	def _wait_for_elements_to_go_away(self, locators):

		for locator in locators :

			element = self._element_find(locator, True, False)
			if element is not None : return "Element '%s' shouldn't have been there" % locator

	###################################################################################################################
	## Clicks an element until there is no error (created to avoid click errors on periodically unclickable elements ##
	###################################################################################################################
	def _wait_for_click_to_succeed(self, locator):

		element = self._element_find(locator, True, False)
		if not element: return "Couldn't find the element '%s', click operation failed" % locator

		element.click()