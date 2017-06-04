require 'administrate/field/select'
require 'rails'

module Administrate
  module Field
    class I18nEnum < Administrate::Field::Select
      class Engine < ::Rails::Engine
      end

      def selectable_options
        enums = collection.map do |k, v|
          label, value = translate(k), k
          [label, value]
        end
        enums.unshift(['', nil]) if @options.fetch(:null, false) == true
        enums
      end

      def translate(value)
        I18n.t("#{class_name}.#{@attribute}.#{value}", scope: @options.fetch(:scope, nil), default: value)
      end

      private

      def class_name
        @options.fetch(:class_name, '').camelcase.downcase
      end

      def collection
        super
        method_name = @attribute.to_s.pluralize
        @collection = @options.fetch(:class_name, '').constantize.send(method_name) if @collection.empty?
        @collection
      end
    end
  end
end
