Gem::Specification.new do |spec|
  spec.name                       = "rspeji"
  spec.version                    = "0.0.2"
  spec.executables                = "rspeji"
  spec.required_rubygems_version  = Gem::Requirement.new(">= 0") if spec.respond_to? :required_rubygems_version=
  spec.authors                    = ["Paolo Fabbri"]
  spec.date                       = %q{2017-09-23}
  spec.description                = %q{Let's put some emoji in your tests}
  spec.email                      = %q{info@internetblacksmith.co.uk}
  spec.files                      = ["lib/rspeji.rb", "bin/rspeji", "lib/emoji.rb"]
  spec.homepage                   = %q{https://github.com/internetblacksmith/rspeji/}
  spec.require_paths              = ["lib"]
  spec.rubygems_version           = %q{2.5.1}
  spec.summary                    = %q{Emoji!!}
  spec.license                    = "MIT"

  spec.add_runtime_dependency "rspec-core", ">= 3.0"
end
