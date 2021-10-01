# frozen_string_literal: true

# Ref: https://medium.com/nerd-for-tech/using-activerecord-enum-in-rails-35edc2e9070f
class ValidateableEnumType < ActiveRecord::Enum::EnumType
  # override the default behavior which normally bubbles an ArgumentError if the key is nonexistent
  #
  # @see https://github.com/rails/rails/blob/v5.2.6/activerecord/lib/active_record/enum.rb#L138-L142
  def assert_valid_value(value)
    value
  end

  # Raise a KeyError if the value isn't a defined enum value during this conversion to a DB value
  #
  # @see https://github.com/rails/rails/blob/v5.2.6/activerecord/lib/active_record/enum.rb#L134-L136
  def serialize(value)
    return unless value

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
