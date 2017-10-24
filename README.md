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

#### Google Analytics

```slim
== render 'radius/ga'
```

