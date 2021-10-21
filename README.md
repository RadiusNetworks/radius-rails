# Radius::Rails

Radius Networks Assets and Generators for Rails Apps.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'radius-rails', github: "RadiusNetworks/radius-rails"

```

Note: If the app you are using doesn't use the updated Twitter Bootstrap Theme, then you will want to use the tag `v0.1.0`:

```ruby
gem 'radius-rails', github: "RadiusNetworks/radius-rails", tag: "v0.1.0"
```

## Usage

This will give you access to the common Radius Networks assets needed in most web apps.

### Stylesheets and Images

Stylesheets can be pulled in with the [asset pipeline](http://guides.rubyonrails.org/asset_pipeline.html) or using [Sass](http://sass-lang.com/):

```scss
@import "radius-theme";
```

You can pull in the favicon by adding the image to the header of your layout:

```slim
head
  link href="#{image_path("favicon.ico")}" rel="shortcut icon"
```

Take a look in the [`app/assets`](app/assets) to see what is included with the gem.

### Generators

You can generate the error pages in `public/` by running the generator:

```
rails generate radius:error_pages
```

### View Partials

A few common partials that are needed across apps.

#### Environment Ribbon

Add the `environment_ribbon` partial right after the opening body tag.

```slim
body
  == render 'radius/environment_ribbon'
```


### Validating Enum Types

When using an `enum`, the default `enum` behavior is to disruptively raise an exception when the
code tries to use a type that isn't within the set. Sometimes this is desired. Other times you want
a gentler response: to render the model invalid, so that it can be remediated by the user through
conventional paths.

The `validating_enum` is a new type helper that can be used in ActiveRecord models to transparently
accomplish this.

Basic usage:
```ruby
class ThrownFruit < ApplicationRecord
  validating_enum fruit_type: %w[apple banana cherry]
end
```
adds this behavior:
```ruby
[1] pry(main)> f = ThrownFruit.last
=>  #<ThrownFruit:0x00000001deadbeef # ...
[2] pry(main)> f.fruit_type = :tomato
=> :tomato
[3] pry(main)> f.valid?
=> false
[4] pry(main)> f.errors
=> #<ActiveModel::Errors:0x00000005cab
 @base=
  #<ThrownFruit:0x00000001deadbeef
   #...>,
 @details={:fruit_type=>[{:error=>:inclusion, :value=>:tomato}]},
 @messages={:fruit_type=>["is not included in the list"]}>
```

Additional examples can be found in [app/models/concerns/validating_enum.rb](https://github.com/RadiusNetworks/radius-rails/blob/master/app/models/concerns/validating_enum.rb#L5-L34).
