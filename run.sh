#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2022-03-27 20:17:27 +0100 (Sun, 27 Mar 2022)
#
#  https://github.com/HariSekhon/CI-CD
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/HariSekhon
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$srcdir"

gh workflow run readme.yaml -f debug="${DEBUG:-false}" -f no_commit="${NO_COMMIT:-false}"

actions_url="$(gh browse -n)/actions"

if [ "$(uname -s)" = "Darwin" ]; then
    open "$actions_url"
fi
