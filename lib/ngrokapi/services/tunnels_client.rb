# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # Tunnels provide endpoints to access services exposed by a running ngrok
    #  agent tunnel session or an SSH reverse tunnel session.
    #
    # https://ngrok.com/docs/api#api-tunnels
    class TunnelsClient
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'tunnels'
      # The API path for the requests
      PATH = '/tunnels'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # List all online tunnels currently running on the account.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnels-list
      def list(
        before_id: nil,
        limit: nil,
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          url: url,
          path: PATH
        )
        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::Tunnel
        )
      end
    end
  end
end