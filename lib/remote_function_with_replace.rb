require 'action_view/helpers/prototype_helper'

module RemoteFunctionWithReplace
  def remote_function(options)
    prototype_javascript_content_type_regexp = '/^\s*(text|application)\/(x-)?(java|ecma)script(;.*)?\s*$/i' # from prototype.js Ajax.Request#respondToReadyState

    if target = options.delete(:replace)
      target = {:complete => target} unless target.is_a?(Hash)
      [:complete, :success, :failure].each { |callback| options[callback] = "$('#{target[callback]}').replace(request.responseText);#{options[callback]}" if target[callback] }
    elsif target = options.delete(:eval_or_replace)
      target = {:complete => target} unless target.is_a?(Hash)
      [:complete, :success, :failure].each { |callback| options[callback] = "if (!(request.getHeader('Content-type') || '').match(#{prototype_javascript_content_type_regexp})) {$('#{target[callback]}').replace(request.responseText);} #{options[callback]}" if target[callback] } # due to poor choice of parameter names, request.getHeader actually returns response headers
    elsif target = options.delete(:eval_or_update)
      target = {:complete => target} unless target.is_a?(Hash)
      [:complete, :success, :failure].each { |callback| options[callback] = "if (!(request.getHeader('Content-type') || '').match(#{prototype_javascript_content_type_regexp})) {$('#{target[callback]}').update(request.responseText);} #{options[callback]}" if target[callback] } # ditto
    end
    super(options)
  end
end

ActionView::Helpers::PrototypeHelper.send(:prepend, RemoteFunctionWithReplace)
