lib = File.expand_path('../app', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yosenabe/version'

Gem::Specification.new do |spec|
  spec.name = 'dokata'
  spec.version = Yosenabe::VERSION
  spec.authors = ['ugdark']
  spec.email = ['ugdark@gmail.com']

  spec.summary = 'dokata example'
  spec.description = 'dokata example'
  spec.homepage = 'http://localhost'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://localhost'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = 'git ls-files -z'.split('\x0').reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['app']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'test-unit', '~> 3.2.5'

end
