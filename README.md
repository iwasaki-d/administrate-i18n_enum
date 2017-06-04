# Administrate::Field::I18nEnum

A plugin to i18n enum attribute select box in [Administrate](https://github.com/thoughtbot/administrate).

i18nに対応したAdministrate用のPluginです。
ActiveRecordモデルのenum属性の表示をi18nのlocaleで置き換えselectboxを表示します。
例えば、ja.ymlを設定することでenumのselectbox子要素のラベルが日本語化されます。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'administrate-field-i18n_enum'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install administrate-field-i18n_enum

## Usage

```ruby
class Human < ApplicationRecord
  enum gender: { male: 0, female: 1 }
end
```

```ruby
gender: Field::I18nEnum.with_options(class_name: 'Human'),
```
Put it into ATTRIBUTE_TYPES of HumanDashboard Class, please.


## Options

| Options    |Type            | Required     | Description                           |
|------------|:--------------:|:------------:|:--------------------------------------|
| class_name |String          | True         | Class name of enum attribute.         |
| collection |Array           | False(Any)   | If irregular plural or want to use custom options. You can set options of array.|
| null       |Boolean         | False(Any)   | True, nil value option will be inserted into select box.         |
| scope      |symbol or Array | False(Any)   | It is used for the scope option of i18n.translate        |

## locales Example
Default:
```yml
ja:
  human:
    gender:
      male: 男性
      female: 女性
```

When set "scope: :enums". 
```yml
ja:
  enums:
    human:
      gender:
        male: 男性
        female: 女性
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iwasaki_d/administrate-field-i18n_enum. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

