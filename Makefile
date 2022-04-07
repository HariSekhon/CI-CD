#
#  Author: Hari Sekhon
#  Date: 2022-04-07 18:13:38 +0100 (Thu, 07 Apr 2022)
#
#  vim:ts=4:sts=4:sw=4:noet
#
#  https://github.com/HariSekhon/CI-CD
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/HariSekhon
#

SHELL = /usr/bin/env bash

.PHONY: default
default: generate
	@:

.PHONY: generate
generate:
	./generate.sh

.PHONY: run
run:
	./run.sh

.PHONY: workflow
workflow: run
	@:
