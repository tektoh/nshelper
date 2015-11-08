class Record < ActiveHash::Base
  self.data = [
    { id: 'A',     typeclass: Resolv::DNS::Resource::IN::A },
    { id: 'AAAA',  typeclass: Resolv::DNS::Resource::IN::AAAA },
    { id: 'CNAME', typeclass: Resolv::DNS::Resource::IN::CNAME },
    { id: 'NS',    typeclass: Resolv::DNS::Resource::IN::NS },
    { id: 'MX',    typeclass: Resolv::DNS::Resource::IN::MX },
    { id: 'TXT',   typeclass: Resolv::DNS::Resource::IN::TXT },
    { id: 'ANY',   typeclass: Resolv::DNS::Resource::IN::ANY }
  ]

  class << self
    def list
      all.map(&:id)
    end

    def typeclass(id)
      find_by_id(id).try(:typeclass)
    end
  end
end
