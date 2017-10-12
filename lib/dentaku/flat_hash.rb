module Dentaku
  module FlatHash
    def flat_hash(hash, k = [])
      if hash.is_a?(Hash)
        hash.inject({}) { |h, v| h.merge! flat_hash(v[-1], k + [v[0]]) }
      elsif hash.is_a?(Array)
        hash.each_with_index.inject({}) { |h, v| h.merge! flat_hash(v[0], ["#{k.join('.')}[#{v[1]}]"]) }
      else
        return { k.join('.') => hash } if k.is_a?(Array)
        { k => hash }
      end
    end
  end
end
