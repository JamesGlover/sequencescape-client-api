require 'sequencescape/asset'
require 'sequencescape/behaviour/receptacle'
require 'sequencescape/behaviour/state_driven'

class Sequencescape::Well < ::Sequencescape::Asset

  include Sequencescape::Behaviour::Receptacle
  include Sequencescape::Behaviour::StateDriven

  belongs_to :plate

  attribute_accessor :location, :pool
  attribute_accessor :initial_volume, :measured_volume, :current_volume

  has_update_action :submit!, :action => 'submit', :verb => :create, :skip_json => true

  def pool_id
    pool.nil? ? nil : pool['id']
  end

end
