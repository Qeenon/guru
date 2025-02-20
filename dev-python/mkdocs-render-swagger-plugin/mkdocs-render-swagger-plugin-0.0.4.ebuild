# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="MKDocs plugin for rendering swagger & openapi files"
HOMEPAGE="
	https://pypi.org/project/mkdocs-render-swagger-plugin/
	https://github.com/bharel/mkdocs-render-swagger-plugin
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/mkdocs"
