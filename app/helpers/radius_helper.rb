module RadiusHelper
  def environment_ribbon
    if ENV['ENVIRONMENT_NAME']
      content_tag(:div, ENV['ENVIRONMENT_NAME'], :id => 'environment_ribbon')
    end
  end
end
