class Responder < ActiveRecord::Base

	self.inheritance_column = nil

	RESP_TYPES = %w(Fire Medical Police)

	EXCLUDED_JSON_ATTRIBUTES = [:id, :created_at, :updated_at]

	validates :type, presence: true
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :capacity, presence: true, inclusion: { in: 1..5 }


	def self.capacity_for(responder_type)
		capacities = []
		responders = Responder.all
		responders = responders.where(type: responder_type)
		capacities << responders.sum(:capacity)
		capacities << (responders.where(emergency_code: nil)).sum(:capacity)
		capacities << (responders.where(on_duty: true)).sum(:capacity)
		capacities << (responders.where(on_duty: true, emergency_code: nil)).sum(:capacity)
	end 

	def self.capacity
		capacities = {}
		RESP_TYPES.each do |responder_types|
			capacities[responder_types] = capacity_for(responder_types)
		end
		capacities
	end


	def as_json(options={})
		exclusion_list = []
		exclusion_list += EXCLUDED_JSON_ATTRIBUTES
		options[:except] ||= exclusion_list
		super(options)
	end



end
