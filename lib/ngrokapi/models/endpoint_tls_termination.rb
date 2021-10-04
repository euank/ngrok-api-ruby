# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointTLSTermination
      attr_reader :client,
        :result,
        :enabled,
        :terminate_at,
        :min_version

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @terminate_at = @result['terminate_at']
        @min_version = @result['min_version']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end
    end
  end
end
