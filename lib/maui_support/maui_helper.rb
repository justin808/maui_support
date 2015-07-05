require "active_support"
require 'active_support/core_ext/object'

module MauiHelper
  # Used to convert string params into symbolized hash of white listed params.
  # If second parameter is nil, then application controller's "params" are used
  def self.white_list_params(param_white_list, the_params = nil)
    the_params ||= params

    the_params.reduce({}) do |memo, (k, v)|
      if param_white_list.has_key?(k.to_sym)
        if param_white_list[k.to_sym].nil?
          memo[k.to_sym] = v
        else
          sub_hash = the_params[k.to_s]
          if sub_hash.present?
            memo[k.to_sym] = white_list_params(param_white_list[k.to_sym], sub_hash)
          end
        end
      end
      memo
    end
  end
end
