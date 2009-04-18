rm -rf tmp/

jruby -S warble
cp sinatra.rb tmp/war/WEB-INF/gems/gems/sinatra-0.9.1.1/lib/sinatra.rb