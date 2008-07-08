module ActionView
  module Helpers
    module PrototypeHelper
      def remote_function_with_replace(options)
  	    if replace = options.delete(:replace)
  	      replace = {:complete => replace} unless replace.is_a?(Hash)
	        [:complete, :success, :failure].each { |callback| options[callback] = "$('#{replace[callback]}').replace(request.responseText);#{options[callback]}" if replace[callback] }
    		  remote_function_without_replace(options)
    		else
    		  remote_function_without_replace(options)
    		end
  		end
  		
      alias_method_chain :remote_function, :replace
  	end
  end
end
