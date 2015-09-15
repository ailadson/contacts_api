require "addressable/uri"
require "rest-client"

def url(path)
  Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: path
  ).to_s
end

def make_request(verb, url, arg = nil)
  arg ? RestClient.send(verb, url, arg) : RestClient.send(verb, url)
rescue RestClient::Exception => e
  e.message
end

def create_contact(params = {})
  make_request(:post, url('/contacts.json'), { contact: params })
end

def index_contacts
  make_request(:get, url('/contacts.json'))
end

def show_contact(id)
  make_request(:get, url("/contacts/#{id}.json"))
end

def update_contact(id, params = {})
  make_request(:patch, url("/contacts/#{id}.json"), { contact: params } )
end

def destroy_contact(id)
  make_request(:delete, url("/contacts/#{id}.json"))
end
