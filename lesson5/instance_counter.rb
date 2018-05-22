module InstanceCounter
  @instances = 0
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      self.instances
    end
  end

  module InstanceMethods
    protected
    def register_instance
      self.instances += 1
    end
  end
end