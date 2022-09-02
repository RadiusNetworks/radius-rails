# # frozen_string_literal: true

# # Ref: https://medium.com/nerd-for-tech/using-activerecord-enum-in-rails-35edc2e9070f
module ValidatingEnum
#   # Macro that wraps the standard Rails `enum` with additional type behavior to support
#   # intutive validation of enum selections
#   #
#   # @param definitions [Hash{Symbol => Object}]
#   #   enum definition and configuration options
#   #
#   # @example Simple minimal example
#   #   validating_enum fruits: %w[apple banana orange]
#   #
#   #   # That is equivalent to writing
#   #   enum fruits: %w[apple banana orange]
#   #   validates :fruits, inclusion: { in: %w[apple banana orange] }
#   #
#   # @example Using standard enum options, such as _prefix
#   #   validating_enum fruits: %w[apple banana orange], _prefix: :available
#   #
#   # @example No default validation
#   #   validating_enum fruits: %w[apple banana orange], _validates: false
#   #
#   # @example Custom validation settings
#   #   validating_enum fruits: %w[apple banana orange],
#   #                   _validates: { allow_blank: true, message: "%{value} is prohibited" }
#   #
#   #   # That is equivalent to writing
#   #   enum sample: fruits: %w[apple banana orange]
#   #   validates :fruits, inclusion: {
#   #     in: %w[apple banana orange],
#   #     allow_blank: true,
#   #     message: "%{value} is prohibited",
#   #   }
#   # @see https://api.rubyonrails.org/v5.2.6/classes/ActiveRecord/Enum.html
#   def validating_enum(definitions) # rubocop:disable Metrics/MethodLength
#     # Extract the validation options as they are not part of the `enum` definitions.
#     #
#     # We are prefixing the options with underscore for parity with the `enum` options.
#     flag_or_options = definitions.delete(:_validates)
#     validates_options = case flag_or_options
#                         when false
#                           nil
#                         when true, nil
#                           {}
#                         else
#                           Hash(flag_or_options)
#                         end

#     # Calling `enum` here will strip out the various options (e.g. `_prefix`) from `definitions`
#     # leaving us with just the enum name and value mappings.
#     enum definitions

#     definitions.each do |name, _values|
#       # We are not going to use the values associated with the mappings as they may be simple
#       # arrays. Instead we lookup the defined values per the prior call to enum and utilize those.
#       enum_values = defined_enums.fetch(name.to_s)

#       # The prior `enum` call utilizes this `decorate_attribute_type` under the hood. According to
#       # the docs, calling `decorate_attribute_type` twice with the same `column_name` and
#       # `decoratore_type` overrides the previous decorator; instead of decorating the attribute
#       # twice.
#       #
#       # Ref https://github.com/rails/rails/blob/v5.2.6/activerecord/lib/active_record/attribute_decorators.rb#L12-L23
#       decorate_attribute_type(name, 'enum') do |subtype|
#         ::ValidateableEnumType.new(name, enum_values, subtype)
#       end

#       if validates_options
#         validates name, inclusion: { in: enum_values.keys.map(&:to_s) }.merge(validates_options)
#       end
#     end
#   end
end
