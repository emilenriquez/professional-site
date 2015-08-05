class Admin::BaseController < ApplicationController

  before_action :require_login
  #load_and_authorize_resource
  #before_action :check_domain_and_env
  before_action :verify_staff_or_admin
  http_basic_authenticate_with name: "rakd", password: "secret" #add basic auth

  # before_action :set_admin_meta_tags

  # if current user don't have access, redirect them back to root page
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  layout 'admin'

  def current_ability
    @current_ability ||= AdminAbility.new(current_user)
  end


  private

  def verify_staff_or_admin
    if current_user.role == :admin  or current_user.role == :staff or current_user.role == :spam_checker or current_user.role == :news_editor or current_user.role == :news_manager
      # no prob, because you are staff or admin.
      return
    else
      # cheking there is admin.
      @admin_user = User.where(:role => :admin).first
      if @admin_user.blank?
        # no admins yet.
        @user = User.where(:id => current_user.id.to_s).first
        if @user.update(:role => :admin)
          # if there is no admin, you can get admin.
          redirect_to '/admin/', :notice => 'you are assigned as admin because there were no admins before. you are first admin!! ' and return
        end
      end
    end
    uri = '/'
    redirect_to uri and return
  end

  def check_domain_and_env

    if Rails.env.development?
      # we can access admin page if development
      return
    end
    if Rails.env.production? or Rails.env.com_production? or Rails.env.staging? or Rails.env.com_staging?

      if request.env['HTTP_HOST'].match(/^(:?staging|production)/)
        # we can access admin page if production and staging|production.* with domain
        return
      end
    end

    url = '/'
    redirect_to url and return
  end

  def set_admin_meta_tags
    set_meta_tags :noindex => true
    set_meta_tags :nofollow => true
  end


  def slack_notification body
    # if Rails.env.development? 
    #   return
    # end

    # message = ""
    # if Rails.env.development? 
    #   message += "==== THIS IS TEST ENVIROMENT"
    # else
    #   message += "===="
    # end

    # message += body + "\n"

    # if current_user
    #   message += "by : " + current_user.username + "\n"
    # end
    # message += "====\n"

    # slack_webhook_url_writers_log = 'https://hooks.slack.com/services/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'
    # notifier = Slack::Notifier.new slack_webhook_url_writers_log , channel: '#gamerz_writers_log', username: 'gamerz_news'

    # notifier.ping message

  end


end
