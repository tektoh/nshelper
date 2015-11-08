class QueriesController < ApplicationController
  def show
    resolver = Resolver.new(query_params)
    @resources = resolver.valid? ? resolver.getresources : nil
  end

  private

  def query_params
    params.permit(:domain, :record, :ns)
  end
end
