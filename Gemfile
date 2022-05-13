#
#  Author: Hari Sekhon
#  Date: 2022-05-13 16:20:04 +0100 (Fri, 13 May 2022)
#
#  vim:ts=4:sts=4:sw=4:et
#
#  https://github.com/HariSekhon/CI-CD
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/HariSekhon
#

# ============================================================================ #
#                                 G e m f i l e
# ============================================================================ #

# needed for Netlify or manual build

source 'https://rubygems.org'
gem 'github-pages'
group :jekyll_plugins do
  gem 'jekyll-optional-front-matter'
end

# on Alpine, installing 'json' and 'bigdecimal' gems solves errors like this:
#
#	bundler: failed to load command: jekyll (/usr/bin/jekyll)
#	Traceback (most recent call last):
#			20: from /usr/bin/bundle:23:in `<main>'
#			19: from /usr/bin/bundle:23:in `load'
#			18: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/exe/bundle:37:in `<top (required)>'
#			17: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/lib/bundler/friendly_errors.rb:130:in `with_friendly_errors'
#			16: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/exe/bundle:49:in `block in <top (required)>'
#			15: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/lib/bundler/cli.rb:24:in `start'
#			14: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/lib/bundler/vendor/thor/lib/thor/base.rb:485:in `start'
#			13: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/lib/bundler/cli.rb:30:in `dispatch'
#			12: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/lib/bundler/vendor/thor/lib/thor.rb:392:in `dispatch'
#			11: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/lib/bundler/vendor/thor/lib/thor/invocation.rb:127:in `invoke_command'
#			10: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/lib/bundler/vendor/thor/lib/thor/command.rb:27:in `run'
#			 9: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/lib/bundler/cli.rb:497:in `exec'
#			 8: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/lib/bundler/cli/exec.rb:28:in `run'
#			 7: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/lib/bundler/cli/exec.rb:63:in `kernel_load'
#			 6: from /usr/lib/ruby/gems/2.7.0/gems/bundler-2.2.2/lib/bundler/cli/exec.rb:63:in `load'
#			 5: from /usr/bin/jekyll:23:in `<top (required)>'
#			 4: from /usr/bin/jekyll:23:in `load'
#			 3: from /usr/lib/ruby/gems/2.7.0/gems/jekyll-3.9.2/exe/jekyll:8:in `<top (required)>'
#			 2: from /usr/lib/ruby/gems/2.7.0/gems/jekyll-3.9.2/exe/jekyll:8:in `require'
#			 1: from /usr/lib/ruby/gems/2.7.0/gems/jekyll-3.9.2/lib/jekyll.rb:29:in `<top (required)>'
#	/usr/lib/ruby/gems/2.7.0/gems/jekyll-3.9.2/lib/jekyll.rb:29:in `require': cannot load such file -- json (LoadError)

gem 'json'
gem 'bigdecimal'
