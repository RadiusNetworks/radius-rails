# frozen_string_literal: true

# Ref: https://medium.com/nerd-for-tech/using-activerecord-enum-in-rails-35edc2e9070f
class ValidateableEnumType < ActiveRecord::Enum::EnumType
  # This is called by the parent class when casting values from user provided input. The return
  # value of this method is used as the return value from {#cast} when the value is not a defined
  # enum. We return the user provided value so that the validator can catch issues later.
  #
  # @see https://github.com/rails/rails/blob/v5.2.6/activerecord/lib/active_record/enum.rb#L138-L142
  def assert_valid_value(value)
    value
  end

  # Raise a KeyError if the value isn't a defined enum value during this conversion to a DB value
  #
  # @see https://github.com/rails/rails/blob/v5.2.6/activerecord/lib/active_record/enum.rb#L134-L136
  def serialize(value)
    return if value.blank?

    case
    when mapping.key?(value)
      mapping[value]
    when mapping.value?(value)
      value
    else
      raise KeyError.new("unknown enum mapping: #{value.inspect}", key: value)
    end
  end
end
