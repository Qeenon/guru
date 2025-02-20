# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )

CRATES="
	aho-corasick-0.5.3
	aho-corasick-0.6.4
	aho-corasick-0.7.8
	ansi_term-0.11.0
	app_dirs-1.2.1
	arc-swap-0.3.11
	atty-0.2.10
	backtrace-0.3.8
	backtrace-sys-0.1.23
	base64-0.8.0
	bincode-1.0.1
	bitflags-1.1.0
	block-0.1.6
	bloodhound-0.5.4
	byteorder-1.2.3
	bytes-0.4.8
	cast-0.2.2
	cc-1.0.45
	cfg-if-0.1.3
	chrono-0.4.2
	clap-2.31.2
	clipboard-0.4.6
	clipboard-win-2.1.2
	cmake-0.1.31
	criterion-0.2.3
	criterion-plot-0.2.3
	criterion-stats-0.2.3
	dtoa-0.4.2
	duct-0.10.0
	either-1.5.0
	error-chain-0.10.0
	error-chain-0.11.0
	error-chain-0.12.0
	failure-0.1.1
	failure_derive-0.1.1
	flate2-1.0.1
	fnv-1.0.6
	fragment-0.3.1
	fuchsia-zircon-0.3.3
	fuchsia-zircon-sys-0.3.3
	gcc-0.3.54
	getrandom-0.1.12
	git2-0.10.1
	glob-0.2.11
	handlebars-0.31.0
	idna-0.2.0
	iovec-0.1.2
	itertools-0.7.8
	itertools-num-0.1.1
	itoa-0.4.1
	jobserver-0.1.17
	kernel32-sys-0.2.2
	lazy_static-1.2.0
	lazycell-0.6.0
	lazycell-1.2.1
	libc-0.2.62
	libgit2-sys-0.9.1
	libz-sys-1.0.25
	linked-hash-map-0.5.1
	linked-hash-map-0.5.4
	log-0.4.8
	luthor-0.1.7
	malloc_buf-0.0.6
	matches-0.1.6
	memchr-0.1.11
	memchr-2.3.0
	miniz-sys-0.1.10
	mio-0.6.16
	mio-uds-0.6.7
	miow-0.2.1
	net2-0.2.33
	nix-0.10.0
	num-integer-0.1.38
	num-traits-0.1.43
	num-traits-0.2.4
	num_cpus-1.10.1
	objc-0.2.2
	objc-foundation-0.1.1
	objc_id-0.1.0
	ole32-sys-0.2.0
	onig-3.2.2
	onig_sys-68.0.1
	os_pipe-0.6.1
	pad-0.1.5
	percent-encoding-2.1.0
	pest-1.0.6
	pest_derive-1.0.7
	pkg-config-0.3.11
	plist-0.2.4
	proc-macro2-0.4.6
	quick-error-1.2.2
	quote-0.3.15
	quote-0.6.3
	rand-0.4.2
	redox_syscall-0.1.40
	redox_termios-0.1.1
	regex-0.1.80
	regex-0.2.11
	regex-1.3.4
	regex-syntax-0.3.9
	regex-syntax-0.4.2
	regex-syntax-0.5.6
	regex-syntax-0.6.14
	rustc-demangle-0.1.8
	safemem-0.2.0
	same-file-1.0.2
	scribe-0.7.2
	serde-1.0.66
	serde_derive-1.0.66
	serde_json-1.0.19
	shared_child-0.3.2
	shell32-sys-0.1.2
	signal-hook-0.1.9
	signal-hook-registry-1.0.1
	simplelog-0.5.2
	slab-0.4.1
	smallvec-0.4.5
	strsim-0.7.0
	syn-0.11.11
	syn-0.14.2
	synom-0.11.3
	synstructure-0.6.1
	syntect-2.1.0
	term-0.5.1
	termion-1.5.1
	textwrap-0.9.0
	thread-id-2.0.0
	thread-scoped-1.0.2
	thread_local-0.2.7
	thread_local-0.3.5
	thread_local-1.0.1
	time-0.1.40
	ucd-util-0.1.1
	unicode-bidi-0.3.4
	unicode-normalization-0.1.7
	unicode-segmentation-1.0.3
	unicode-width-0.1.5
	unicode-xid-0.0.4
	unicode-xid-0.1.0
	unreachable-1.0.0
	url-2.1.0
	utf8-ranges-0.1.3
	utf8-ranges-1.0.0
	vcpkg-0.2.3
	vec_map-0.8.1
	version_check-0.9.2
	void-1.0.2
	walkdir-2.1.4
	wasi-0.7.0
	winapi-0.2.8
	winapi-0.3.5
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	ws2_32-sys-0.2.1
	x11-clipboard-0.2.2
	xcb-0.8.2
	xdg-2.1.0
	xml-rs-0.7.0
	yaml-rust-0.3.5
	yaml-rust-0.4.0
"

inherit cargo python-single-r1

DESCRIPTION="A complete text editor for your terminal."
HOMEPAGE="https://github.com/jmacdonald/amp"
SRC_URI="
	https://github.com/jmacdonald/amp/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD MIT MPL-2.0 Unlicense"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	x11-libs/libxcb
	dev-lang/python-exec[native-symlinks]
"

RDEPEND="${DEPEND}"

BDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
	dev-vcs/git
	>=dev-lang/rust-1.53.0
	dev-util/cmake
"

QA_FLAGS_IGNORED="usr/bin/.*"

python_setup () {
	default
}
src_configure() {
	cargo_src_configure
}

src_compile() {
	cargo_src_compile
}

src_install() {
	if use doc; then
		dodoc README.md CHANGELOG.md
		dodoc -r documentation/*
		einstalldocs
	fi
	dobin target/release/amp
}
