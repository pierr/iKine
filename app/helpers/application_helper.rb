module ApplicationHelper
  # Return a title on a per-page basis.
   def title
     base_title = "iKine"
     if @title.nil?
       base_title
     else
       "#{base_title} | #{@title}"
     end
   end
   
   #methode pour charger le logo
   def logo
       image_tag("iKine.png", :alt => "iKine", :class => "round",  :height=> "70") #Permet de charger le logo
    end
end
