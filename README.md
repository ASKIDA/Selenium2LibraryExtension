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

## Documentation
The complete documentation of new keywords can be found [here](https://axon-id.github.io/Selenium2LibraryExtension/ "S2LExp keywords documentation"). The library also features a fix to a logic error in the _wait until_ family keywords, where it didn't handle exceptions (resulting in keywords sometimes failing even if their timeout hadn't been reached). The patch can be seen in [/patches](https://github.com/axon-id/Selenium2LibraryExtension/tree/master/Library/patches "Patches directory")
