module ApplicationHelper
  
  # Sets the page title and outputs title if container is passed in.
  # eg. <%= title('Hello World', :h2) %> will return the following:
  # <h2>Hello World</h2> as well as setting the page title.
  def title(str, container = nil)
    @page_title = str
    content_tag(container, str) if container
  end
  
  # Outputs the corresponding flash message if any are set
  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << content_tag(:div, html_escape(flash[msg.to_sym]), :id => "flash-#{msg}") unless flash[msg.to_sym].blank?
    end
    messages
  end
  
  def gravatar_url_for(email, options = {})      
   url_for({ :gravatar_id => Digest::MD5.hexdigest(email), 
     :host => 'www.gravatar.com',                     
     :protocol => 'http://', 
     :only_path => false, 
     :controller => 'avatar.php' }.merge(options))  
  end
  
  def grit_repo_name(repo)
    repo.path.split("/")[-2]
  end
end
