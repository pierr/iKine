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
   
   #methode qui permet de générer un lien qui fait un tri sur la colonne column avec pour champ titl
   def sortable(column, title = nil)
      title ||= column.titleize
      direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc" 
      link_to title, :sort =>column ,:direction => direction 
   end
end
