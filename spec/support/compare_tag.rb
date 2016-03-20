class CompareTag
  class << self
    def compare_hash_instance(hash, instance)
      hash = ActiveSupport::HashWithIndifferentAccess.new hash

      ( hash[:name] == instance.name )
    end

    def compare_hash_hash(hash_a, hash_b)
      hash_a = ActiveSupport::HashWithIndifferentAccess.new hash_a
      hash_b = ActiveSupport::HashWithIndifferentAccess.new hash_b

      ( hash_a[:name] == hash_b[:name] )
    end
  end
end
