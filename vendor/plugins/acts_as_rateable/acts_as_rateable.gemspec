Gem::Specification.new do |s|
  s.name     = "acts_as_rateable"
  s.version  = "2.0.1"
  s.date     = "2009-09-23"
  s.summary  = "Rails plugin providing a rating interface for ActiveRecord models"
  s.email    = "michael@mobalean.com"
  s.homepage = "http://github.com/mreinsch/acts_as_rateable"
  s.description = "Acts_as_rateable is a rails plugin providing a rating interface for ActiveRecord models."
  s.has_rdoc = true
  s.authors  = ["Ferenc Fekete", "Gabriel Gironda", "Michael Reinsch"]
  s.rdoc_options  = ["--main", "README.rdoc"]
  s.extra_rdoc_files = ["README.rdoc", "CHANGELOG.rdoc", "MIT-LICENSE"]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

