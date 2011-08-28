module CanTango
  class Configuration
    class Adapters < Registry
   
      def adapter name
        raise "Unknown adapter #{name}" if !available_adapters.include? name.to_sym
        require "cantango/adapter/#{name}"
      end

      def bootstrap *names
        names.each {|name| adapter name }
      end

      def available_adapters
        [:moneta, :compiler]
      end
   
    end
  end
end


