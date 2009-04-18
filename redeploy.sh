rm -rf tmp/
cp /Users/xdite/jruby/lib/jruby-complete.jar lib/ 
cd lib
sh split-jruby.sh
cd ..
jruby -S warble
cp sinatra.rb tmp/war/WEB-INF/gems/gems/sinatra-0.9.1.1/lib/sinatra.rb
/Users/xdite/appengine-java-sdk-1.2.0/bin/appcfg.sh update tmp/war/
