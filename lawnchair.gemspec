# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lawnchair}
  s.version = "0.6.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Shane Wolf"]
  s.date = %q{2010-07-13}
  s.description = %q{Fully featured caching mechanism for arbitrary pieces of resource expensive ruby code using Redis while being able to optionally store data in the Ruby process itself for maximum efficiency.}
  s.email = %q{shanewolf@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lawnchair.gemspec",
     "lib/active_record_extension.rb",
     "lib/lawnchair.rb",
     "lib/marshal_extension.rb",
     "lib/storage_engine/abstract.rb",
     "lib/storage_engine/composite.rb",
     "lib/storage_engine/in_process.rb",
     "lib/storage_engine/redis.rb",
     "lib/view/helper.rb",
     "spec/lawnchair_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/speed.rb",
     "spec/speed_results.png",
     "spec/storage_engine/abstract_spec.rb",
     "spec/storage_engine/composite_spec.rb",
     "spec/storage_engine/in_process_spec.rb",
     "spec/storage_engine/redis_spec.rb"
  ]
  s.homepage = %q{http://github.com/gizm0duck/lawnchair}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Speed up your app by caching expensive code in Redis or in the ruby process itself}
  s.test_files = [
    "spec/lawnchair_spec.rb",
     "spec/spec_helper.rb",
     "spec/speed.rb",
     "spec/storage_engine/abstract_spec.rb",
     "spec/storage_engine/composite_spec.rb",
     "spec/storage_engine/in_process_spec.rb",
     "spec/storage_engine/redis_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<redis>, [">= 0.1.2"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.2"])
    else
      s.add_dependency(%q<redis>, [">= 0.1.2"])
      s.add_dependency(%q<activesupport>, [">= 2.3.2"])
    end
  else
    s.add_dependency(%q<redis>, [">= 0.1.2"])
    s.add_dependency(%q<activesupport>, [">= 2.3.2"])
  end
end

