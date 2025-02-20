# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

DESCRIPTION="The client library for BackBlaze's B2 product"
HOMEPAGE="https://github.com/Backblaze/b2-sdk-python"
SRC_URI="https://github.com/Backblaze/b2-sdk-python/releases/download/v${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}/${PN}-1.17.2-disable-requirement-installation.patch"
)

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/arrow-1.0.2[${PYTHON_USEDEP}]
		>=dev-python/logfury-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/requests-2.9.1[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.5.0[${PYTHON_USEDEP}]
	')
"

distutils_enable_tests pytest

BDEPEND+=" test? (
	$(python_gen_cond_dep '
		>=dev-python/pytest-mock-3.6.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-lazy-fixture-0.6.3[${PYTHON_USEDEP}]
	')
)"

# These tests seem to require some b2 authentication (they're integration tests
# so this is not unreasonable)
python_test() {
	epytest \
		--deselect test/integration/test_large_files.py::TestLargeFile::test_large_file \
		--deselect test/integration/test_raw_api.py::test_raw_api \
		--deselect test/integration/test_download.py::TestDownload::test_large_file \
		--deselect test/integration/test_download.py::TestDownload::test_small \
		--deselect test/integration/test_download.py::TestDownload::test_small_unverified \
		--deselect test/integration/test_download.py::TestDownload::test_gzip \
		--deselect test/unit/account_info/test_sqlite_account_info.py::TestSqliteAccountProfileFileLocation::test_invalid_profile_name \
		--deselect test/unit/account_info/test_sqlite_account_info.py::TestSqliteAccountProfileFileLocation::test_profile_and_file_name_conflict \
		--deselect test/unit/account_info/test_sqlite_account_info.py::TestSqliteAccountProfileFileLocation::test_profile_and_env_var_conflict \
		--deselect test/unit/account_info/test_sqlite_account_info.py::TestSqliteAccountProfileFileLocation::test_profile_and_xdg_config_env_var \
		--deselect test/unit/account_info/test_sqlite_account_info.py::TestSqliteAccountProfileFileLocation::test_profile \
		--deselect test/unit/account_info/test_sqlite_account_info.py::TestSqliteAccountProfileFileLocation::test_file_name \
		--deselect test/unit/account_info/test_sqlite_account_info.py::TestSqliteAccountProfileFileLocation::test_env_var \
		--deselect test/unit/account_info/test_sqlite_account_info.py::TestSqliteAccountProfileFileLocation::test_default_file_if_exists \
		--deselect test/unit/account_info/test_sqlite_account_info.py::TestSqliteAccountProfileFileLocation::test_xdg_config_env_var \
		--deselect test/unit/account_info/test_sqlite_account_info.py::TestSqliteAccountProfileFileLocation::test_default_file
}
