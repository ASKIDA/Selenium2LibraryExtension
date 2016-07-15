# Selenium2LibraryExtension For Robot Framework

## Introduction
This library was created as an expansion to [Selenium2Library](https://github.com/axon-id/Selenium2Library "Selenium2Library on GitHub"). It was initially created as a solution to specific test cases that required overhead (such as calling inline javascripts or using many steps for one action). It also features bugfixes.

## Installation
Only available as a standalone library yet. Simply clone the whole project, and import [S2LExp.py](https://github.com/axon-id/Selenium2LibraryExtension/tree/master/Library "Selenium2LibraryExtension.py directory") in your Robot Framework project. If your project already imports Selenium2Library, remove it from your imports _(This library already imports it)_. A PyPi package will be created for this project eventually _(todo)_. Running the script in [/dependencies](https://github.com/axon-id/Selenium2LibraryExtension/tree/master/Dependencies "Dependencies directory") should do the trick (If you have [pip](https://pip.pypa.io/en/stable/ "Python pip documentation"))

## Requirements
Until we deploy a PyPi package, you will need to take care of prerequisites, which are of course, Selenium WebDriver, and Selenium2Library.
* [Selenium2Library](https://github.com/axon-id/Selenium2Library "Selenium2Library on GitHub")
* [Selenium WebDriver](https://github.com/SeleniumHQ/selenium/tree/master/py "Selenium for Python on GitHub")

Long story short, you can run the following command (if you have [pip](https://pip.pypa.io/en/stable/ "Python pip documentation") installed).
```
pip install robotframework-selenium2library
```
## Documentation
The complete documentation of new keywords can be found [here](https://axon-id.github.io/Selenium2LibraryExtension/ "S2LExp keywords documentation"). The library also features a fix to a logic error in the _wait until_ family keywords, where it didn't handle exceptions (resulting in keywords sometimes failing even if their timeout hadn't been reached). The patch can be seen in [/patches](https://github.com/axon-id/Selenium2LibraryExtension/tree/master/Library/patches "Patches directory")
