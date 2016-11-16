# -*- coding: utf-8 -*-

import time
import robot
from Selenium2Library import Selenium2Library

class _patches():

	def __init__(self):
	
		pass

	def _wait_until_exp(self, timeout, error, function, *args):
		"""This replaces the method from Selenium2Library to fix the major logic error in it"""
	
		error = error.replace('<TIMEOUT>', self._format_timeout(timeout))
	
		def wait_func():
			return None if function(*args) else error
			
		self._wait_until_no_error_exp(timeout, wait_func)

	def _wait_until_no_error_exp(self, timeout, wait_func, *args):
		"""This replaces the method from Selenium2Library to fix the major logic error in it"""
	
		timeout = robot.utils.timestr_to_secs(timeout) if timeout is not None else self._timeout_in_secs
		maxtime = time.time() + timeout
		
		while True:
		
			try:
				timeout_error = wait_func(*args)
				if not timeout_error: return
				if time.time() > maxtime: raise AssertionError(timeout_error)
				time.sleep(0.2)
				
			except AssertionError:
			
				raise
				
			except:
			
				if time.time() > maxtime: raise
				continue
		
	# patches here
	Selenium2Library._wait_until = _wait_until_exp
	Selenium2Library._wait_until_no_error = _wait_until_no_error_exp