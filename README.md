# Railspacker
Railspacker is a alternative to Webpacker. The motivation is to give more control over the webpack to the developer, avoiding wrapping it in ruby, opting for the configuration.

## Status

This is an early version, if you liked the design concept, and intend to use it, let me know. Consider contributing, knowledge with testing for rails plugins will be welcome.

## Prerequisites

- Ruby 5.1 (+ Yarn);
- WebpackManifestPlugin on;

## Getting started
Add this line to your application's Gemfile:

```ruby
gem 'railspacker'
```

Then run `bundle install`

Next, you need to run the generator:
```bash
$ rails generate railspacker:install
```

Add script in application template via `pack_path`
```html
<%= javascript_include_tag pack_path('pack_name.js') %>
```

Railspacker has created the necessary files and a preconfiguration for you to begin development. Read the next session to understand how to proceed.

## Usage

### Development

Start WebpackDevServer in separated process to serve live code reloading assets:
```bash
$ yarn run serve
```

**NOTE:** The devServer already comes preconfigured, if you want to change the configuration, be sure to look at the railspacker configuration in `config/initializers/railspacker.rb`

### Test

System test approach is: compile packs before tests. For this, Railspacker installer added command `Railspacker.run 'build-test'` to your ApplicationSystemTestCase. So, when you run System Tests, yarn will run package script named `'build-test'`. The output `public/packs-test` will be created, and ignored to git via `.gitignore`

### Production

To production environment, Railspacker enhance the task `rails assets:precompile`. Thus, the packages will be compiled soon after the assets `task:precompile`.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
