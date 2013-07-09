require 'resolv'

class Signupvalidations

def self.is_valid_domain(domain)
    Resolv::DNS.open do |dns|
        resolv = dns.getresources domain.to_s, Resolv::DNS::Resource::IN::A
	    results = Array.new
        resolv.map do |r|
            results << r.address
        end
        results.size == 0 ? (false) : (true)
    end
end

def self.is_dictionary_word(word)
    return File.read(File.join(File.dirname(File.expand_path(__FILE__)), '') + "/british-english").include?(word.to_s)
end

end

