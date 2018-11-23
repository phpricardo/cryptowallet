module ApplicationHelper
    def locale
       I18n.locale == :en ? "Estados Unidos" : "Brasil"
    end
end
