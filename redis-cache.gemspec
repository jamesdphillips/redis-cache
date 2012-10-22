$:.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = "redis-cache"
  s.version = '0.0.1'
  s.homepage = "https://github.com/jamesdphillips/rails-cache"
  s.summary = "Redis Rails Cache client."
  s.authors = [ "James Phillips"]
  s.email = ["jamesdphillips@gmail.com"]

  s.description = <<-EOS
    Rails cache using Redis-rb.
  EOS

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_dependency("redis")
  s.add_development_dependency("rake")
end