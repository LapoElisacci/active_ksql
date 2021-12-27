# frozen_string_literal: true

require_relative 'lib/active_ksql/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_ksql'
  spec.version       = ActiveKsql::VERSION
  spec.authors       = ['Lapo']
  spec.email         = ['lapoelisacci@gmail.com']

  spec.summary       = 'Kafka ksqlDB ORM for Ruby'
  spec.description   = ''
  spec.homepage      = 'https://github.com/LapoElisacci/ksql'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.4.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/LapoElisacci/active_ksql'
  spec.metadata['changelog_uri'] = 'https://github.com/LapoElisacci/active_ksql/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 5'
  spec.add_dependency 'activemodel', '>= 5'
  spec.add_dependency 'httparty', '~> 0'
end
