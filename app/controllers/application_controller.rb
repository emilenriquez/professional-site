class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def team_name
  	'incodenito' 
  end

  def tag_line
  	'Turning caffeine into awesome web and mobile apps'
  end

  def set_default_meta_tags
    set_meta_tags :canonical   => 'http://emilenriquez.com'
    set_meta_tags :description => 'Emil Enriquez Developer Profile, Blog, Tutorial and Q&A'
    set_meta_tags :keywords => 'emilenriquez, Emil Enriquez, Emil Enriquez Developer, Web and Android Developer, Android, Web, Ruby on Rails, emilenriquez tutorial, Ruby Tutorial'
    set_meta_tags :site_name => 'emilenriquez'
    
    set_meta_tags :og => {:title    => 'emilenriquez',
                          :type     => 'website',
                          :url      => 'https://emilenriquez.com',
                          :site      => 'EmilEnriquez',      
                          :description => tag_line,                    
    }
   
   	set_meta_tags :og => {:image => asset_path 'profile-picture.jpg'} if @game.pic_icon_url.present?

  end
end
