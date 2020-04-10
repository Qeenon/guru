# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.0

EAPI=7

CRATES="
adler32-1.0.4
ansi_term-0.11.0
anyhow-1.0.26
arrayref-0.3.6
arrayvec-0.5.1
atty-0.2.14
autocfg-1.0.0
backtrace-0.3.38
backtrace-sys-0.1.23
base64-0.10.1
base64-0.11.0
base64-0.9.3
bitflags-1.2.1
blake2b_simd-0.5.10
byte-unit-3.0.3
byteorder-1.3.4
bytes-0.4.12
cc-1.0.50
cfg-if-0.1.10
chrono-0.4.11
clap-2.33.0
clicolors-control-1.0.1
cloudabi-0.0.3
console-0.9.2
constant_time_eq-0.1.5
crc32fast-1.2.0
crossbeam-deque-0.7.3
crossbeam-epoch-0.8.2
crossbeam-queue-0.2.1
crossbeam-utils-0.7.2
directories-2.0.2
dirs-1.0.5
dirs-sys-0.3.4
dockworker-0.0.15
either-1.5.3
encode_unicode-0.3.6
errno-0.1.8
errno-0.2.4
errno-dragonfly-0.1.1
failure-0.1.7
failure_derive-0.1.7
filetime-0.2.8
fnv-1.0.6
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.1.29
futures-cpupool-0.1.8
gcc-0.3.55
getch-0.2.1
getrandom-0.1.14
h2-0.1.26
heck-0.3.1
hermit-abi-0.1.8
hex-0.3.2
hex-0.4.2
http-0.1.21
http-body-0.1.0
httparse-1.3.4
hyper-0.12.35
hyperlocal-0.6.0
hyperx-0.14.0
idna-0.1.5
indexmap-1.3.2
iovec-0.1.4
itoa-0.4.5
kernel32-sys-0.2.2
language-tags-0.2.2
lazy_static-1.4.0
libc-0.2.67
libflate-0.1.27
libproc-0.5.0
lock_api-0.3.3
log-0.4.8
matches-0.1.8
maybe-uninit-2.0.0
memoffset-0.5.3
mime-0.3.16
mio-0.6.21
mio-uds-0.6.7
miow-0.2.1
named_pipe-0.2.4
net2-0.2.33
nix-0.11.1
num-integer-0.1.42
num-traits-0.2.11
num_cpus-1.12.0
pager-0.15.0
parking_lot-0.9.0
parking_lot_core-0.6.2
percent-encoding-1.0.1
proc-macro-error-0.4.11
proc-macro-error-attr-0.4.11
proc-macro2-1.0.9
process_path-0.1.1
procfs-0.7.7
procs-0.9.20
quote-1.0.3
redox_syscall-0.1.56
redox_users-0.3.4
regex-1.3.4
regex-syntax-0.6.16
rle-decode-fast-1.0.1
rust-argon2-0.7.0
rustc-demangle-0.1.16
rustc_version-0.2.3
ryu-1.0.2
safemem-0.3.3
scopeguard-1.1.0
semver-0.9.0
semver-parser-0.7.0
serde-1.0.104
serde_derive-1.0.104
serde_json-1.0.48
slab-0.4.2
smallvec-0.6.13
smallvec-1.2.0
string-0.2.1
strsim-0.8.0
structopt-0.3.11
structopt-derive-0.4.4
syn-1.0.16
syn-mid-0.5.0
synstructure-0.12.3
take_mut-0.2.2
tar-0.4.26
termios-0.2.2
termios-0.3.1
textwrap-0.11.0
time-0.1.42
tokio-0.1.22
tokio-buf-0.1.1
tokio-codec-0.1.2
tokio-current-thread-0.1.7
tokio-executor-0.1.10
tokio-fs-0.1.7
tokio-io-0.1.13
tokio-reactor-0.1.12
tokio-sync-0.1.8
tokio-tcp-0.1.4
tokio-threadpool-0.1.18
tokio-timer-0.2.13
tokio-udp-0.1.6
tokio-uds-0.2.6
toml-0.5.6
try-lock-0.2.2
unicase-2.6.0
unicode-bidi-0.3.4
unicode-normalization-0.1.12
unicode-segmentation-1.6.0
unicode-width-0.1.7
unicode-xid-0.2.0
unix_socket-0.5.0
url-1.7.2
users-0.9.1
vec_map-0.8.1
version_check-0.9.1
void-1.0.2
want-0.2.0
wasi-0.9.0+wasi-snapshot-preview1
which-3.1.1
winapi-0.2.8
winapi-0.3.8
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
ws2_32-sys-0.2.1
xattr-0.2.2
"

inherit cargo

DESCRIPTION="A modern replacement for ps"

HOMEPAGE="https://github.com/dalance/procs"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"

LICENSE="Apache-2.0 BSD BSD-2 CC0-1.0 MIT ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""
