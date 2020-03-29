# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7} )

DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="This is a pytest plugin to help you test projects that use Trio"
HOMEPAGE="
	https://github.com/python-trio/pytest-trio
	https://pypi.org/project/pytest-trio
"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# lots of different errors
RESTRICT="test"

RDEPEND="
	>=dev-python/async_generator-1.9[${PYTHON_USEDEP}]
	dev-python/outcome[${PYTHON_USEDEP}]
	>=dev-python/trio-0.11[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	test? (
		>=dev-python/hypothesis-3.64[${PYTHON_USEDEP}]
		!~dev-python/pytest-3.7.0[${PYTHON_USEDEP}]
		!~dev-python/pytest-3.7.1[${PYTHON_USEDEP}]
		dev-python/trio-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs/source

python_prepare_all() {
	# AttributeError("module 'pytest' has no attribute 'RemovedInPytest4Warning'",)
	rm pytest_trio/_tests/conftest.py || die

	distutils-r1_python_prepare_all
}

python_test() {
	# has to be run in source dir
	PYTHONPATH="${S}"
	cd "${S}" || die
	pytest -vv || die "Tests fail with ${EPYTHON}"
}
