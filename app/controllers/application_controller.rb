class ApplicationController < ActionController::Base
    helper_method :site_name, :region_name
    
    def self.site_name
      "VotreMarketplace"
    end
    
    def self.region_name
      "Maroc"
    end
  end