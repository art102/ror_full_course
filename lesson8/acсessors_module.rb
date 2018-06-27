module Accessor
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*variables)
      variables.each do |name|
        var_name = "@#{name}".to_sym
        var_history = "@#{name}_history".to_sym

        define_method(name.to_sym) { instance_variable_get(var_name) }
        define_method("#{name}_history".to_sym) { instance_variable_get(var_history) }

        define_method("#{name}=".to_sym) do |value|
          var_value = instance_variable_get(var_name)
          history = instance_variable_get(var_history) || []
          instance_variable_set(var_history, (history) << var_value) if var_value
          instance_variable_set(var_name, value)
        end
      end
    end

    def strong_attr_accessor(name, type)
      var_name = "@#{name}".to_sym
      define_method(name.to_sym) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        raise ArgumentError, 'Wrong type of instance variable!' unless value.is_a? type
        instance_variable_set(var_name, value)
      end
    end
  end
end