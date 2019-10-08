# -*- encoding: utf-8 -*-
# stub: dropzonejs-rails 0.8.4 ruby lib

Gem::Specification.new do |s|
  s.name = "dropzonejs-rails".freeze
  s.version = "0.8.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jos\u00E9 Nahuel Cuesta Luengo".freeze]
  s.date = "2018-11-12"
  s.description = "Adds Dropzone, a great JS File upload by Matias Meno, to the Rails Asset pipeline.".freeze
  s.email = ["nahuelcuestaluengo@gmail.com".freeze]
  s.homepage = "http://www.github.com/ncuesta/dropzonejs-rails".freeze
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Integrates Dropzone JS File upload into Rails Asset pipeline.".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<octokit>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<faraday>.freeze, ["~> 0.8.0"])
      s.add_runtime_dependency(%q<rails>.freeze, ["> 3.1"])
    else
      s.add_dependency(%q<octokit>.freeze, ["~> 1.0"])
      s.add_dependency(%q<faraday>.freeze, ["~> 0.8.0"])
      s.add_dependency(%q<rails>.freeze, ["> 3.1"])
    end
  else
    s.add_dependency(%q<octokit>.freeze, ["~> 1.0"])
    s.add_dependency(%q<faraday>.freeze, ["~> 0.8.0"])
    s.add_dependency(%q<rails>.freeze, ["> 3.1"])
  end
end
