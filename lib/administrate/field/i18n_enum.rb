require 'administrate/field/select'
require 'rails'

module Administrate
  module Field
    class I18nEnum < Administrate::Field::Select
      class Engine < ::Rails::Engine; end

      def enum_options
        enums = collection.map do |k, v|
          [I18n.t(i18n_path(class_name, @attribute, k), default: k), k]
        end
        enums.unshift(['', nil]) if @options[:null] == true
      end

      def class_name
        @options[:class_name].downcase
      end

      def i18n_path(class_name, attribute, value)
        i18n_path = "#{class_name}.#{attribute}.#{value}"
        i18n_path = "#{@options[:scope]}." + i18n_path unless @options[:scope].nil?
        i18n_path
      end
    end
  end
end
