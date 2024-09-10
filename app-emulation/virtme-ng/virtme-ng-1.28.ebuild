# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} pypy3 )

RESTRICT=network-sandbox

DESCRIPTION="Makes working with vms and kernels easy"
HOMEPAGE="https://github.com/arighi/virtme-ng/ https://pypi.org/project/virtme-ng/"
EGIT_REPO_URI="https://github.com/arighi/${PN}"
EGIT_COMMIT="v${PV}"

inherit distutils-r1 bash-completion-r1 git-r3

# should be busybox w/ static feature here.
RDEPEND="
>=dev-python/argcomplete-3.5.0:0
>=dev-python/argparse-manpage-4.6:0
>=dev-python/requests-2.32.3:0
"

DEPEND="
${RDEPEND}
"

BDEPEND="${DEPEND}
>=dev-python/flake8-7.1.1:0
>=dev-python/pylint-3.2.6:0
>=virtual/rust-1.79.0:0
>=dev-python/argcomplete-3.5.0:0
>=app-emulation/qemu-8.2.3:0
dev-vcs/git:0
"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="amd64"

export BUILD_VIRTME_NG_INIT=1

python_install_all() {
	distutils-r1_python_install_all
    newbashcomp "${ED}/usr/lib/${EPYTHON}/site-packages/usr/share/bash-completion/completions/virtme-ng-prompt" "virtme-ng"
    newbashcomp "${ED}/usr/lib/${EPYTHON}/site-packages/usr/share/bash-completion/completions/vng-prompt" "vng"
    newman "${ED}/usr/lib/${EPYTHON}/site-packages/usr/share/man/man1/vng.1" "vng.1"
}


