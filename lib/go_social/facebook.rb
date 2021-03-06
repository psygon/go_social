module GoSocial
  module Facebook
    include GoSocial::Assistant

    LIKE_BUTTON_CLASS = "fb-like"
    LIKE_BOX_CLASS = "fb-like-box"
    COMMENT_CLASS = "fb-comments"
    
    # Facebook Like Button
    def like_button(options = {})
      clazz = GoSocial::Facebook
      params = clazz.options_to_data(clazz.default_options_like_button.merge(options))
      params.merge!(class: LIKE_BUTTON_CLASS)

      html = "".html_safe
      html << content_tag(:div, nil, id: "fb-root")
      html << clazz.script
      html << content_tag(:div, nil, params)
      html
    end

    # Facebook Like Box
    def like_box(options = {})
      clazz = GoSocial::Facebook
      params = clazz.options_to_data(clazz.default_options_like_box.merge(options))
      params.merge!(class: LIKE_BOX_CLASS)

      html = "".html_safe
      html << content_tag(:div, nil, id: "fb-root")
      html << clazz.script
      html << content_tag(:div, nil, params)
      html
    end

    # Facebook Comment Box
    def comment_box(options = {})
      clazz = GoSocial::Facebook
      params = clazz.options_to_data(clazz.default_options_comment_box.merge(options))
      params.merge!(class: COMMENT_CLASS)

      html = "".html_safe
      html << content_tag(:div, nil, id: "fb-root")
      html << clazz.script
      html << content_tag(:div, nil, params)
      html
    end

   
    class << self
      def default_options_like_button
        @default_options ||= {	  
          send: "false",
          layout: "box_count",
          width: "250",
          action: "like",
          font: "arial",
          colorscheme: "light"
        }.merge("show-faces" => "false")
      end

     
      def default_options_like_box
        @default_options ||= {	  
          send: "false",
          stream: "true",
          width: "250", 
          height: "150",          
          header: "true",
          colorscheme: "light"
        }.merge("show-faces" => "true", "show-border" => "true")
      end

      
      def default_options_comment_box
        @default_options ||= {	
          width: "250",         
          colorscheme: "light"
        }.merge("num-posts" => "2")
      end
      
      # Facebook Script
      def script    
        '<script>  
      (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, "script", "facebook-jssdk"));
    </script>'.html_safe
      end

    end
  end
end
