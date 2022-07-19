require 'rubygems'
require 'rest-client'
require 'solid_assert'

class ApiClient
    attr_accessor :basic_url, :token, :method, :headers, :body

    def initialize
        @basic_url = nil
        @token = nil
        @method = nil
        @headers = {}
        @body = nil
    end

    def send_request
        RestClient::Request.execute(url: @basic_url, method: self.set_request_method, 
            payload: @body, headers: @headers)
    end

    def assert_response_code(code, response)
        assert code == response.code, "Response code is not equal #{code}"
    end

    private

    def set_request_method
        @method = method.downcase
        case @method
        when 'get'
            :get
        when 'post'
            :post
        when 'patch'
            :patch
        when 'delete'
            :delete
        else
            fail 'Not implemented or incorrect method.'
        end
    end
end