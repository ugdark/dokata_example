source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in yosenabe.gemspec
gemspec

# たぶんdokataのgemspecに依存かけば解決するはず。
gem 'slack-ruby-client', '~> 0.9.1'
gem 'config', '~> 1.4.0'
gem 'activesupport', '~> 5.1', '>= 5.1.4'

gem 'dokata', '0.1.0', :path => 'modules/dokata'

gem 'rake', '~> 12.0.0', :group => [:development, :test, :local]
gem 'yard', '~> 0.9.9', :group => [:development, :test, :local]
gem 'test-unit', '~> 3.2.5', :group => [:development, :test, :local]
gem 'test-unit-rr', '~> 1.0', '>= 1.0.5', :group => [:development, :test, :local]
