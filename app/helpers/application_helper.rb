module ApplicationHelper
    def custom_link(href, req, text)
        "<a href='#{href}' data-method='#{req}'>#{text}</a>".html_safe
    end
end
