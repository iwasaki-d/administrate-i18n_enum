require 'administrate/field/select'
require 'rails'

module Administrate
  module Field
    class I18nEnum < Administrate::Field::Select
      class Engine < ::Rails::Engine
      end

      def enum_options
        enums = collection.map do |k, v|
          [translate(class_name, @attribute, k), k]
        end
        enums.unshift(['', nil]) if @options.fetch(:null, false) == true
        enums
      end

      def class_name
        @options.fetch(:class_name, '').camelcase.downcase
      end

      def translate(class_name, attribute, value)
        I18n.t("#{class_name}.#{attribute}.#{value}", scope: @options.fetch(:scope, nil), default: value)
      end

      private

      def collection
        super
        method_name = @attribute.to_s.pluralize
        @collection = @options.fetch(:class_name, '').constantize.send(method_name) if @collection.empty?
        @collection
      end
    end
  end
end
