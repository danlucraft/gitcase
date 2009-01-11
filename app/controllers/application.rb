
class ApplicationController < ActionController::Base
  include ExceptionNotifiable
  include AuthenticatedSystem
  include RoleRequirementSystem

  helper :all # include all helpers, all the time
  protect_from_forgery :secret => 'b0a876313f3f9195e9bd01473bc5cd06'
  filter_parameter_logging :password, :password_confirmation
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  # Debugging server output
  if Rails.env == "development"
    before_filter :debug_begin_request
    after_filter :debug_end_request
  end
      
  # Prints Merb-style useful information about request
  def debug_begin_request
    str = <<END
   ~ Start: #{Time.now}
   ~ Params: #{params.inspect}
   ~ Session: #{session.instance_variable_get(:@data).inspect}
END
    @__start_action_time = Time.now
    puts str
  end
  
  def debug_end_request
    str = <<END
   ~ Time: #{Time.now - @__start_action_time}
   ~
   
END
    puts str
  end
  
  protected
  
  # Automatically respond with 404 for ActiveRecord::RecordNotFound
  def record_not_found
    render :file => File.join(RAILS_ROOT, 'public', '404.html'), :status => 404
  end
end

