# frozen_string_literal: true

module NgrokAPI
  module Models
    ##
    # A resource representing data from the api_keys API
    class ApiKey
      attr_reader :id,
        :client,
        :created_at,
        :description,
        :metadata,
        :result,
        :token,
        :uri

      def initialize(client:, result:)
        @client = client
        @result = result
        @created_at = @result['created_at']
        @id = @result['id']
        @description = @result['description']
        @metadata = @result['metadata']
        @token = @result['token']
        @uri = @result['uri']
      end

      # TODO: equality
      def ==(other)
      end

      # TODO: to_s
      def to_s
      end

      ##
      # Delete this API key.
      #
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-api-keys-delete
      def delete
        @client.delete(id: @id)
      end

      ##
      # Update the attributes of this API key.
      #
      # rubocop:disable LineLength
      # @param [string] description human-readable description of what uses the API key to authenticate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined data of this API key. optional, max 4096 bytes
      # @return [NgrokAPI::Models::ApiKey] result from update request
      # rubocop:enable LineLength
      #
      # https://ngrok.com/docs/api#api-api-keys-update
      def update(description: nil, metadata: nil)
        @description = description if description
        @metadata = metadata if metadata
        @client.update(id: @id, description: description, metadata: metadata)
      end
    end
  end
end