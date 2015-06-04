class ComplexQuery < ActiveRecord::Base
  def self.query_by_sql(query_string, args_array)
    # Notice how you can, and should, still sanitize params here.
    self.connection.execute(sanitize_sql([query_string, *args_array]))
  end
end
