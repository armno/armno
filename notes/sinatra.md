# Sinatra - A Ruby Framework

Sinatra is a lightweigth Ruby web framework.

## Installing Sinatra

### Install Ruby

```sh
$ sudo apt-get install ruby1.9.3
```

Then use `RubyGems` to install `sinatra` gem. (Ruby 1.9.3 shipped with RubyGems.)

```sh
$ gem install sinatra
```

## Create a web page with Sinatra

### Default route

create a file `app.rb`

```ruby
require "sinatra"

get / do
  "Hello from Sinatra"
end
```

then run Sinatra using

```sh
$ ruby app.rb 
```

View the app at `http://localhost:4567`


### Sinatra Gems

- `shotgun`
- `sinatra/reload`
- `haml`