#!/bin/sh
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2022-05-13 16:43:29 +0100 (Fri, 13 May 2022)
#
#  https://github.com/harisekhon/jenkins
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/harisekhon
#

# Alpine / Wget:
#
#   wget -O- https://raw.githubusercontent.com/HariSekhon/jenkins/master/setup/bootstrap.sh | sh
#
# Curl:
#
#   curl https://raw.githubusercontent.com/HariSekhon/jenkins/master/setup/bootstrap.sh | sh

set -eu
[ -n "${DEBUG:-}" ] && set -x
srcdir="$(dirname "$0")"

repo="https://github.com/HariSekhon/CI-CD"

directory="cicd"

sudo=""
[ "$(whoami)" = "root" ] || sudo=sudo

if [ "$(uname -s)" = Darwin ]; then
    echo "Bootstrapping on Mac OS X:  $repo"
    if ! type brew >/dev/null 2>&1; then
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | $sudo ruby
    fi
elif [ "$(uname -s)" = Linux ]; then
    echo "Bootstrapping on Linux:  $repo"
    if type apk >/dev/null 2>&1; then
        $sudo apk --no-cache add bash ruby-dev ruby-bundler build-base
    elif type apt-get >/dev/null 2>&1; then
        if [ -n "${CI:-}" ]; then
            export DEBIAN_FRONTEND=noninteractive
        fi
        opts=""
        if [ -z "${PS1:-}" ]; then
            opts="-qq"
        fi
        $sudo apt-get update $opts
        $sudo apt-get install $opts -y git build-essential ruby-dev ruby-bundler
    elif type yum >/dev/null 2>&1; then
        if grep -qi 'NAME=.*CentOS' /etc/*release; then
            echo "CentOS EOL detected, replacing yum base URL to vault to re-enable package installs"
            $sudo sed -i 's/^[[:space:]]*mirrorlist/#mirrorlist/' /etc/yum.repos.d/CentOS-Linux-*
            $sudo sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|' /etc/yum.repos.d/CentOS-Linux-*
        fi
        $sudo yum install -y git ruby-devel rubygem-bundler make gcc gcc-c++ redhat-rpm-config # needs to make and compile ruby bits
    else
        echo "Package Manager not found on Linux, cannot bootstrap"
        exit 1
    fi
else
    echo "Only Mac & Linux are supported for conveniently bootstrapping all install scripts at this time"
    exit 1
fi

if [ "${srcdir##*/}" = setup ]; then
    cd "$srcdir/.."
else
    # if this is an empty directory eg. a cache mount, then remove it to get a proper checkout
    rmdir "$directory" 2>/dev/null || :
    if [ -d "$directory" ]; then
        cd "$directory"
        git pull
    else
        git clone "$repo" "$directory"
        cd "$directory"
    fi
fi

# XXX: fails on Alpine on older versions of Docker with error like this
# XXX: workaround is to use alpine:3.13
#
#	Gem::FilePermissionError: You don't have write permissions for the /usr/lib/ruby/gems/3.0.0 directory.
#	  /usr/lib/ruby/3.0.0/rubygems/installer.rb:715:in `verify_gem_home'
#	  /usr/lib/ruby/3.0.0/rubygems/installer.rb:896:in `pre_install_checks'
#	  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.33/lib/bundler/rubygems_gem_installer.rb:64:in `pre_install_checks'
#	  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.33/lib/bundler/rubygems_gem_installer.rb:12:in `install'
#	  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.33/lib/bundler/source/rubygems.rb:204:in `install'
#	  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.33/lib/bundler/installer/gem_installer.rb:54:in `install'
#	  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.33/lib/bundler/installer/gem_installer.rb:16:in `install_from_spec'
#	  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.33/lib/bundler/installer/parallel_installer.rb:186:in `do_install'
#	  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.33/lib/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
#	  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.33/lib/bundler/worker.rb:62:in `apply_func'
#	  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.33/lib/bundler/worker.rb:57:in `block in process_queue'
#	  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.33/lib/bundler/worker.rb:54:in `loop'
#	  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.33/lib/bundler/worker.rb:54:in `process_queue'
#	  /usr/lib/ruby/gems/3.0.0/gems/bundler-2.2.33/lib/bundler/worker.rb:91:in `block (2 levels) in create_threads'

bundle install

bundle exec jekyll build
