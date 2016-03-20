class ComparePlace
  class << self
    def compare_hash_instance(hash, instance)
      hash = ActiveSupport::HashWithIndifferentAccess.new hash

      ( hash[:name] == instance.name ) &&
      ( hash[:description] == instance.description ) &&
      ( hash[:lat] == instance.lat ) &&
      ( hash[:lon] == instance.lon ) &&
      ( hash[:city] == instance.city ) &&
      ( hash[:state] == instance.state ) &&
      ( hash[:zip] == instance.zip ) &&
      ( hash[:street] == instance.street )
    end

    def compare_hash_hash(hash_a, hash_b)
      hash_a = ActiveSupport::HashWithIndifferentAccess.new hash_a
      hash_b = ActiveSupport::HashWithIndifferentAccess.new hash_b

      ( hash_a[:name] == hash_b[:name] ) &&
      ( hash_a[:description] == hash_b[:description] ) &&
      ( hash_a[:lat] == hash_b[:lat] ) &&
      ( hash_a[:lon] == hash_b[:lon] ) &&
      ( hash_a[:city] == hash_b[:city] ) &&
      ( hash_a[:state] == hash_b[:state] ) &&
      ( hash_a[:zip] == hash_b[:zip] ) &&
      ( hash_a[:street] == hash_b[:street] )
    end
  end
end
