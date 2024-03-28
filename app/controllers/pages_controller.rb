class PagesController < ApplicationController
    skip_before_action :require_user, only: [:homepage]
    def homepage 
    end
end
 