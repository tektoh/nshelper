require 'resolv'

class Resolver
  include Virtus.model
  include ActiveModel::Validations

  attribute :domain, String
  attribute :record, String
  attribute :ns, String

  VALID_HOSTNAME_REGEX = /(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])/ix

  validates :domain, format: { with: VALID_HOSTNAME_REGEX }
  validates :record, inclusion: { in: Record.list }
  validates :ns, format: { with: VALID_HOSTNAME_REGEX }

  def getresources
    resolv = Resolv::DNS.new(nameserver: ns)
    results = resolv.getresources(domain, typeclass).map do |resource|
      resource_to_hash(resource)
    end
    results.compact
  end

  def typeclass
    Record.typeclass(record)
  end

  def resource_to_hash(resource)
    data = [
      { typeclass: Resolv::DNS::Resource::IN::SOA, func: :resource_soa_to_hash },
      { typeclass: Resolv::DNS::Resource::IN::NS, func: :resource_ns_to_hash },
      { typeclass: Resolv::DNS::Resource::IN::A, func: :resource_a_to_hash },
      { typeclass: Resolv::DNS::Resource::IN::AAAA, func: :resource_aaaa_to_hash },
      { typeclass: Resolv::DNS::Resource::IN::CNAME, func: :resource_cname_to_hash },
      { typeclass: Resolv::DNS::Resource::IN::MX, func: :resource_mx_to_hash },
      { typeclass: Resolv::DNS::Resource::IN::TXT, func: :resource_txt_to_hash }
    ].find { |data| resource.is_a?(data[:typeclass]) }

    send(data[:func], resource) unless data.nil?
  end

  def resource_soa_to_hash(resource)
    {
      type: 'SOA',
      ttl: resource.ttl,
      expire: resource.expire,
      minimum: resource.minimum,
      mname: resource.mname.to_s,
      refresh: resource.refresh,
      retry: resource.retry,
      rname: resource.rname.to_s,
      serial: resource.serial
    }
  end

  def resource_ns_to_hash(resource)
    {
      type: 'NS',
      ttl: resource.ttl,
      name: resource.name.to_s
    }
  end

  def resource_a_to_hash(resource)
    {
      type: 'A',
      ttl: resource.ttl,
      address: resource.address.to_s
    }
  end

  def resource_aaaa_to_hash(resource)
    {
      type: 'AAAA',
      ttl: resource.ttl,
      address: resource.address.to_s
    }
  end

  def resource_cname_to_hash(resource)
    {
      type: 'className',
      ttl: resource.ttl,
      name: resource.name.to_s
    }
  end

  def resource_mx_to_hash(resource)
    {
      type: 'MX',
      ttl: resource.ttl,
      exchange: resource.exchange.to_s,
      preference: resource.preference
    }
  end

  def resource_txt_to_hash(resource)
    {
      type: 'TXT',
      ttl: resource.ttl,
      data: resource.data
    }
  end
end
