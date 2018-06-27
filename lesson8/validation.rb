module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name, type, arg = nil)
      @validations ||= []
      @validations << { name: name, type: type, arg: arg }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        valid_method = "validate_#{validation[:type]}".to_sym
        var = instance_variable_get("@#{validation[:name]}")
        arg = validation[:arg]
        arg ? send(valid_method, var, arg) : send(valid_method, var)
      end
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    private

    def validate_presence(var)
      raise ArgumentError 'Parameter does not have characters!' if var.nil? || var.empty?
    end

    def validate_format(var, format)
      raise ArgumentError 'Incorrect format of parameter!' unless var =~ format
    end

    def validate_type(var, type)
      if type.class == Class
        raise ArgumentError 'Incorrect type of parameter!' unless var.is_a? type
      elsif type.class == Symbol
        raise ArgumentError 'Incorrect type of parameter!' unless var == type
      else
        raise ArgumentError 'Wrong type!!!'
      end
    end
  end
end