require "spec_helper"

describe Moneybird::Service::Webhook do
  let(:client) { faked_client }

  let(:service) { Moneybird::Service::Webhook.new(client, '123') }

  describe "#all" do
    before do
      client.http.register_request(:GET, '/api/v2/123/webhooks', FakeResponse.new(200, json_response(:webhooks)))
    end

    it "returns list of webhooks" do
      webhooks = service.all

      webhooks.length.must_equal 1
      webhooks.first.url.must_equal "http://www.mocky.io/v2/5185415ba171ea3a00704eed"
    end
  end
end
