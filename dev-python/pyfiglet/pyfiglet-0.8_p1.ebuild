# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} pypy3 )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Pure-python FIGlet implementation"
HOMEPAGE="
	https://pypi.org/project/pyfiglet/
	https://github.com/pwaller/pyfiglet
"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"

# requires subprocess32
RESTRICT="test"

distutils_enable_tests pytest
