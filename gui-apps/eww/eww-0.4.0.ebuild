# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ahash-0.7.6
	aho-corasick-0.7.19
	ansi_term-0.12.1
	anyhow-1.0.63
	ascii-canvas-3.0.0
	atk-0.15.1
	atk-sys-0.15.1
	atty-0.2.14
	autocfg-1.1.0
	base64-0.13.0
	beef-0.5.2
	bincode-1.3.3
	bit-set-0.5.3
	bit-vec-0.6.3
	bitflags-1.3.2
	bytes-1.2.1
	cairo-rs-0.15.12
	cairo-sys-rs-0.15.1
	cfg-expr-0.10.3
	cfg-if-1.0.0
	clap-2.34.0
	clap-3.2.20
	clap_derive-3.2.18
	clap_lex-0.2.4
	codemap-0.1.3
	codespan-reporting-0.11.1
	console-0.15.1
	convert_case-0.4.0
	core-foundation-sys-0.8.3
	crossbeam-channel-0.5.6
	crossbeam-deque-0.8.2
	crossbeam-epoch-0.9.10
	crossbeam-utils-0.8.11
	crunchy-0.2.2
	ctor-0.1.23
	derive_more-0.99.17
	diff-0.1.13
	dirs-next-2.0.0
	dirs-sys-next-0.1.2
	either-1.8.0
	ena-0.14.0
	encode_unicode-0.3.6
	env_logger-0.7.1
	extend-1.1.2
	field-offset-0.3.4
	filetime-0.2.17
	fixedbitset-0.4.2
	fsevent-sys-4.1.0
	futures-channel-0.3.24
	futures-core-0.3.24
	futures-executor-0.3.24
	futures-io-0.3.24
	futures-macro-0.3.24
	futures-sink-0.3.24
	futures-task-0.3.24
	futures-util-0.3.24
	gdk-0.15.4
	gdk-pixbuf-0.15.11
	gdk-pixbuf-sys-0.15.10
	gdk-sys-0.15.1
	gdkx11-0.15.5
	gdkx11-sys-0.15.1
	gethostname-0.2.3
	getrandom-0.2.7
	gio-0.15.12
	gio-sys-0.15.10
	glib-0.15.12
	glib-macros-0.15.11
	glib-sys-0.15.10
	gobject-sys-0.15.10
	grass-0.11.2
	gtk-0.15.5
	gtk-layer-shell-0.4.1
	gtk-layer-shell-sys-0.4.1
	gtk-sys-0.15.3
	gtk3-macros-0.15.4
	hashbrown-0.11.2
	hashbrown-0.12.3
	heck-0.4.0
	hermit-abi-0.1.19
	humantime-1.3.0
	indexmap-1.9.1
	inotify-0.9.6
	inotify-sys-0.1.5
	insta-1.19.1
	itertools-0.10.3
	itoa-1.0.3
	kqueue-1.0.6
	kqueue-sys-1.0.3
	lalrpop-0.19.8
	lalrpop-util-0.19.8
	lasso-0.5.1
	lazy_static-1.4.0
	levenshtein-1.0.5
	libc-0.2.132
	linked-hash-map-0.5.6
	lock_api-0.4.8
	log-0.4.17
	maplit-1.0.2
	memchr-2.5.0
	memoffset-0.6.5
	mio-0.8.4
	new_debug_unreachable-1.0.4
	nix-0.24.2
	nix-0.25.0
	notify-5.0.0
	ntapi-0.3.7
	num-bigint-0.4.3
	num-integer-0.1.45
	num-rational-0.4.1
	num-traits-0.2.15
	num_cpus-1.13.1
	once_cell-1.14.0
	os_str_bytes-6.3.0
	output_vt100-0.1.3
	pango-0.15.10
	pango-sys-0.15.10
	parking_lot-0.12.1
	parking_lot_core-0.9.3
	pest-2.3.0
	petgraph-0.6.2
	phf-0.9.0
	phf_generator-0.9.1
	phf_macros-0.9.0
	phf_shared-0.9.0
	phf_shared-0.10.0
	pico-args-0.4.2
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.25
	ppv-lite86-0.2.16
	precomputed-hash-0.1.1
	pretty_assertions-1.3.0
	pretty_env_logger-0.4.0
	proc-macro-crate-1.2.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.19
	proc-macro2-1.0.43
	quick-error-1.2.3
	quote-1.0.21
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.3
	rayon-1.5.3
	rayon-core-1.9.3
	redox_syscall-0.2.16
	redox_users-0.4.3
	ref-cast-1.0.9
	ref-cast-impl-1.0.9
	regex-1.6.0
	regex-syntax-0.6.27
	ron-0.7.1
	rustc_version-0.3.3
	rustc_version-0.4.0
	rustversion-1.0.9
	ryu-1.0.11
	same-file-1.0.6
	scopeguard-1.1.0
	semver-0.11.0
	semver-1.0.13
	semver-parser-0.10.2
	serde-1.0.144
	serde_derive-1.0.144
	serde_json-1.0.85
	signal-hook-registry-1.4.0
	similar-2.2.0
	simple-signal-1.1.1
	siphasher-0.3.10
	slab-0.4.7
	smallvec-1.9.0
	smart-default-0.6.0
	socket2-0.4.7
	static_assertions-1.1.0
	string_cache-0.8.4
	strsim-0.8.0
	strsim-0.10.0
	strum-0.24.1
	strum_macros-0.24.3
	syn-1.0.99
	sysinfo-0.26.2
	system-deps-6.0.2
	term-0.7.0
	termcolor-1.1.3
	terminal_size-0.1.17
	textwrap-0.11.0
	textwrap-0.15.0
	thiserror-1.0.33
	thiserror-impl-1.0.33
	tiny-keccak-2.0.2
	tokio-1.21.0
	tokio-macros-1.8.0
	tokio-util-0.7.3
	toml-0.5.9
	ucd-trie-0.1.5
	unescape-0.1.0
	unicode-ident-1.0.3
	unicode-width-0.1.9
	unicode-xid-0.2.3
	vec_map-0.8.2
	version-compare-0.1.0
	version_check-0.9.4
	wait-timeout-0.2.0
	walkdir-2.3.2
	wasi-0.11.0+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-wsapoll-0.1.1
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.36.1
	windows_aarch64_msvc-0.36.1
	windows_i686_gnu-0.36.1
	windows_i686_msvc-0.36.1
	windows_x86_64_gnu-0.36.1
	windows_x86_64_msvc-0.36.1
	x11-2.20.0
	x11rb-0.10.1
	x11rb-protocol-0.10.0
	yaml-rust-0.4.5
	yansi-0.5.1
"
inherit cargo

DESCRIPTION="Elkowars Wacky Widgets is a standalone widget system made in Rust"
HOMEPAGE="https://github.com/elkowar/eww"
SRC_URI="
	https://github.com/elkowar/eww/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="
	Apache-2.0
	|| ( Apache-2.0 MIT )
	|| ( Apache-2.0 BSL-1.1 )
	|| ( Artistic-2 CC0-1.0 )
	BSD
	CC0-1.0
	ISC
	MIT
	|| ( MIT Unlicense )
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="wayland"

DEPEND="
	>=gui-libs/gtk-3.0
	x11-libs/pango
	x11-libs/gdk-pixbuf
	x11-libs/cairo
	>=dev-libs/glib-2.0
	sys-libs/glibc
	sys-devel/gcc
	wayland? (
	gui-libs/gtk-layer-shell
	)
"
BDEPEND="
	$DEPEND
"
RDEPEND="
	$DEPEND
"

QA_FLAGS_IGNORED="usr/bin/.*"

src_compile() {
	use wayland && features="--no-default-features --features=wayland"
	cargo_src_compile ${features}
}

src_install() {
	dodoc README.md CHANGELOG.md
	cd target/release || die
	dobin eww
	elog "Eww wont run without a config file (usually in ~/.config/eww)."
	elog "For example configs visit https://github.com/elkowar/eww#examples"
}

