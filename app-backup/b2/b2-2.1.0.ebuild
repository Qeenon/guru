# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..8} )

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="Command-line tool for BackBlaze's B2 product"
HOMEPAGE="https://github.com/Backblaze/B2_Command_Line_Tool"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}/${P}-nameclash.patch"
)

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/arrow-0.8.0[${PYTHON_USEDEP}]
		>=dev-python/b2sdk-1.2.0[${PYTHON_USEDEP}]
		<dev-python/b2sdk-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/phx-class-registry-3.0.5[${PYTHON_USEDEP}]
	')
"

distutils_enable_tests pytest

python_test() {
	epytest \
		--deselect test/integration/test_b2_command_line.py::test_integration \
		--deselect test/unit/test_arg_parser.py::TestCustomArgTypes::test_parse_millis_from_float_timestamp \
		--deselect test/unit/test_console_tool.py::TestConsoleTool::test_sync_exclude_if_modified_after_exact \
		--deselect test/unit/test_console_tool.py::TestConsoleTool::test_sync_exclude_if_modified_after_in_range
}

pkg_postinst() {
	elog "The b2 executable has been renamed to backblaze2 in order to"
	elog "avoid a name clash with b2 from boost-build"
}
