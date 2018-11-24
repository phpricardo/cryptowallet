module ApplicationHelper
    def locale
       I18n.locale == :en ? "Estados Unidos" : "Brasil"
    end

    def flash_class(level)
    case level
        when 'notice' then "alert alert-info"
        when 'success' then "alert alert-success"
        when 'error' then "alert alert-danger"
        when 'alert' then "alert alert-warning"
    end
    end
end
