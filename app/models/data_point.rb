require 'csv'

class DataPoint < ActiveRecord::Base

  def self.import(file)
  	CSV.foreach(file.path, headers:true) do |row|
  		DataPoint.create(createCompleteHash(row.to_hash))
  	end
  end

  def self.createCompleteHash(hash)
  	averagePrice = (hash['bid'].to_f + hash['ask'].to_f) / 2
  	hash["averagePrice"] = averagePrice
  	hash
  end

  def percentChangeOf(startPoint, currentPoint)
  	x = ((currentPoint.to_f - startPoint.to_f) / startPoint.to_f)*100.00
  	x == 0.0 ? 0.0000000001 : x
  end

end
