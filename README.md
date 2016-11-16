[![Python 3 Support](https://img.shields.io/badge/Python_3.5-Yes-brightgreen.svg)]() [![Python 2.7 Support](https://img.shields.io/badge/Python_2.7-Yes-brightgreen.svg)]() [![Selenium 3 Support](https://img.shields.io/badge/Selenium 3-Yes-brightgreen.svg)]()

# Selenium2LibraryExtension For Robot Framework

## Introduction
This library was created as an expansion to [Selenium2Library](https://github.com/axon-id/Selenium2Library "Selenium2Library on GitHub"). It was initially created as a solution to specific test cases that required overhead (such as calling inline javascripts or using many steps for one action). It also features bugfixes.

## Installation
To install Selenium2LibraryExtension, you can use [pip](https://pip.pypa.io/en/stable/ "Python pip documentation"), by using the following command:
```
pip install Selenium2LibraryExtension
```

Or if you prefer to install from source
```
python setup.py install
```

## Importing
For informations on how to import a library into your Robot Framework project, see the [user guide](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#using-test-libraries "Robot Framework User Guide"). You do not need to import Selenium2Library, it is imported from within Selenium2LibraryExtension already.

## Documentation
The complete documentation of new keywords can be found [here](https://axon-id.github.io/Selenium2LibraryExtension/ "S2LExt keywords documentation"). The library also features a fix to a logic error in the _wait until_ family keywords, where it didn't handle exceptions (resulting in keywords sometimes failing even if their timeout hadn't been reached). The patch can be seen in [/patches](https://github.com/axon-id/Selenium2LibraryExtension/tree/master/src/Selenium2LibraryExtension/patches "Patches directory")
