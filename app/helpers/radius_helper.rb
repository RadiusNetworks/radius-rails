module RadiusHelper
  def kracken_url
    if defined? Kracken::PROVIDER_URL
      Kracken::PROVIDER_URL
    else
      ENV.fetch('RADIUS_OAUTH_PROVIDER_URL') { "https://account.radiusnetworks.com" }
    end
  end

  def environment_ribbon
    if ENV['ENVIRONMENT_NAME']
      content_tag(:div, ENV['ENVIRONMENT_NAME'], :id => 'environment_ribbon')
    end
  end

  def masquerading?
    #session[:admin_user_id]
    cookies[:_radius_user_masquerade] && current_user
  end

  def end_masquerade_path
    if respond_to?(:masquerade_destroy_path)
      masquerade_destroy_path
    else
      "#{kracken_url}/admin/masquerade/destroy"
    end
  end


end
