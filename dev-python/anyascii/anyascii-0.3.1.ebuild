# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=(python3_{9..11})
inherit distutils-r1

DESCRIPTION="Unicode to ASCII transliteration"
HOMEPAGE="
	https://pypi.org/project/anyascii/
"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/anyascii/anyascii.git"
else
	inherit pypi
	KEYWORDS="~amd64 ~arm64"
fi

LICENSE="ISC"
SLOT="0"

distutils_enable_tests pytest

src_compile() {
	if [[ ${PV} == *9999 ]]; then
		pushd "${S}/impl/python" || die
		distutils-r1_src_compile
		popd || die
	else
		distutils-r1_src_compile
	fi
}

src_install() {
	if [[ ${PV} == *9999 ]]; then
		pushd "${S}/impl/python" || die
		distutils-r1_src_install
		popd || die
	else
		distutils-r1_src_install
	fi
}
