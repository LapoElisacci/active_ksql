# frozen_string_literal: true

require 'httparty'

module ActiveKsql
  #
  # KsqlDB API Client
  #
  class Api
    attr_accessor :base_uri, :client, :headers

    KSQL_ENDPOINT = 'ksql'
    QUERY_ENDPOINT = 'query'

    def initialize
      @base_uri = ActiveKsql.config.host
      @headers = {
        'Accept' => 'application/vnd.ksql.v1+json; q=0.9, application/json; q=0.5',
        'Authorization' => "Basic #{ActiveKsql.config.api_key}:#{ActiveKsql.config.api_secret}"
      }
      @client = HTTParty
    end

    #
    # Perform requests to the /ksql endpoint of ksqlDB REST API
    #
    # @param [String] sql The ksqlDB SQL Statement
    # @param [Hash] streams_properties ksqlDB streamsProperties param
    # @param [Hash] session_variables ksqlDB sessionVariables param
    # @param [Int] command_sequence_number ksqlDB commandSequenceNumber param
    #
    # @return [Hash/Array] Request response
    #
    def ksql(sql, streams_properties: nil, session_variables: nil, command_sequence_number: nil)
      post(KSQL_ENDPOINT, body: { ksql: sql, streamsProperties: streams_properties, sessionVariables: session_variables, commandSequenceNumber: command_sequence_number }.compact)
    end

    #
    # Perform requests to the /query endpoint of ksqlDB REST API
    #
    # @param [String] sql The ksqlDB SQL Statement
    # @param [Hash] streams_properties ksqlDB streamsProperties param
    #
    # @return [Hash/Array] Request response
    #
    def query(sql, streams_properties: nil)
      post(QUERY_ENDPOINT, body: { ksql: sql, streamsProperties: streams_properties }.compact)
    end

    private

      #
      # Perform the HTTP Request
      #
      # @param [String] endpoint ksqlDB REST API Endpoint
      # @param [Hash] body HTTP Request Body
      #
      # @return [Hash/Array] Request response
      #
      def post(endpoint, body: {})
        client.post("#{base_uri}/#{endpoint}", headers: headers, body: body.to_json).parsed_response
      end
  end
end
