json.resources @resources do |resource|
  [
    :address, :data, :name, :exchange, :expire, :minimum, :mname, :preference,
    :refresh, :retry, :rname, :serial, :ttl, :type
  ].each do |key|
    json.set! key, resource[key] if resource[key].present?
  end
end
