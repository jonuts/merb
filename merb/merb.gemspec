#!/usr/bin/env gem build
# -*- encoding: utf-8 -*-

# Assume a typical dev checkout to fetch the current version information
require File.expand_path('../../merb-core/lib/merb-core/version', __FILE__)

require 'date'

# What version of DM we need
DM_VERSION_REQUIREMENT = '~> 1.0'.freeze

Gem::Specification.new do |gem|
  gem.name        = 'merb'
  gem.version     = Merb::VERSION.dup
  gem.date        = Date.today.to_s
  gem.authors     = ['The Merb Team']
  gem.email       = 'team@merbivore.com'
  gem.homepage    = 'http://merbivore.com/'
  gem.description = 'The Merb stack'
  gem.summary     = 'The Merb stack includes the most common merb plugins plus datamapper'

  gem.has_rdoc = true 
  gem.require_paths = ['lib']
  gem.extra_rdoc_files = ['README', 'LICENSE']
  gem.files = Dir['{lib,spec}/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")

  gem.add_dependency 'merb-action-args',      "= #{Merb::VERSION}"
  gem.add_dependency 'merb-assets',           "= #{Merb::VERSION}"
  gem.add_dependency 'merb-auth',             "= #{Merb::VERSION}"
  gem.add_dependency 'merb-cache',            "= #{Merb::VERSION}"
  gem.add_dependency 'merb-exceptions',       "= #{Merb::VERSION}"
  gem.add_dependency 'merb-gen',              "= #{Merb::VERSION}"
  gem.add_dependency 'merb-haml',             "= #{Merb::VERSION}"
  gem.add_dependency 'merb-helpers',          "= #{Merb::VERSION}"
  gem.add_dependency 'merb-mailer',           "= #{Merb::VERSION}"
  gem.add_dependency 'merb-param-protection', "= #{Merb::VERSION}"
  gem.add_dependency 'merb-slices',           "= #{Merb::VERSION}"
  gem.add_dependency 'merb_datamapper',       "= #{Merb::VERSION}"
  gem.add_dependency 'dm-core',               DM_VERSION_REQUIREMENT
  gem.add_dependency 'dm-sqlite-adapter',     DM_VERSION_REQUIREMENT
  gem.add_dependency 'rspec'

  # Requirements
  gem.requirements << 'install the json gem to get faster json parsing'
  gem.required_ruby_version = '>= 1.8.6'
end
