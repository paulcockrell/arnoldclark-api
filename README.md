# Arnold Clark Apiapp

What is the Arnold Clark Image api app?
---------------------------------------

The api app is intended to take any processing away from the main application (webapp) that the user interacts with. This means the main site can be under heavy use and not suffer from much of a performance hit. This app does all the heavy lifting, accross multiple threads.

With many clients consuming APIs its good to have an app dedicated to consuming these requests. Sinatra is generally used, but here we use a trimmed down version of Rails, which has been reported to have a modest 10%+ performance increase over a regular Rails app.

The image loader api is designed to always return a json object for each image request (so we should always have 12 responces for a registration/stock reference). It will return image meta-data which includes 'present' which identifies if the image is on the image server for rendering. This is what the main app uses to identify which images to load, and which to not load.

It's all over kill, but good fun.

Install and run
---------------

1. Install Ruby 2.1.0 and bundle gem
2. Install api app and run
```shell
git clone https://github.com/paulcockrell/arnoldclark-api.git
cd ./arnoldclark-api
bundle install
bundle exec rails-api s -p 3001 # this port number is vital
```

Test
----

You must have the API app running as we do browser tests that call out to it.

Also there is a currently known registration and stock reference hardcoded into the test, if that is no longer valid then the tests (or one) will fail.

```shell
cd ./arnoldclark-webapp
bundle exec rspec -f documentation
```
