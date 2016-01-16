Gem::Specification.new do |s|
  s.name        = 'rapinoe'
  s.version     = '0.0.3'
  s.licenses    = ['MIT']
  s.summary     = "Parse Keynote files in Ruby."
  s.description = "Rapinoe is designed to parse the native files for Apple's Keynote presentation software. Its main focus is to help extract previews and general metadata about the presentation."
  s.authors     = ["Zach Holman"]
  s.email       = 'zach@zachholman.com'
  s.files       = ["lib/rapinoe.rb"]
  s.homepage    = 'https://github.com/holman/rapinoe'
  s.require_paths = %w[lib]
  s.add_runtime_dependency 'fastimage', '~> 1.8', '>= 1.8.1'
  s.add_runtime_dependency 'rubyzip', '~> 1.1', '>= 1.1.7'

  # = MANIFEST =
  s.files = %w[
    Gemfile
    Gemfile.lock
    LICENSE.md
    README.md
    Rakefile
    lib/rapinoe.rb
    lib/rapinoe/keynote.rb
    lib/rapinoe/slide.rb
    rapinoe.gemspec
    test/fixtures/ice-cream.key
    test/test_keynote.rb
    test/test_rapinoe.rb
    test/test_slide.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
