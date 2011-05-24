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
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc" 
      css_class = column == sort_column ? "current #{sort_direction}" : nil
      link_to title, params.merge(:sort =>column ,:direction => direction , :page=>nil), {:class => css_class}
   end
   
   #Methode qui permet de generer des onglets portant le nom de ceux presents dans le tableau qu'on passe en parametre
   #par defaut on prend le premier
   def onglets(onglets, selected = 1)
     html_a_rendre = "
       <div id='mes_onglets'>
    		  <ul class='liste_onglet' >".html_safe
      i = 1
     onglets.each do |onglet|
      if i == selected
        html_a_rendre = html_a_rendre+"<li id='o_#{i}' class='mon_onglet_selected' onclick='changeOnglet(this);'>#{onglet}</li>".html_safe
      else
        html_a_rendre = html_a_rendre+"<li id='o_#{i}' class='mon_onglet' onclick='changeOnglet(this);'>#{onglet}</li>".html_safe
      end
      i=i+1
     end
     html_a_rendre = html_a_rendre+"<div class='clear'></div>
     	  </ul>
      </div>
     ".html_safe
    return html_a_rendre
   end
   
   def debut_contenu_onglets
    return 	"<div id='mes_contenus'> <!-- Debut des onglets-->".html_safe
   end
   def fin_contenu_onglets
    return "</div> <!-- fin des onglet-->".html_safe
   end
   def debut_contenu_onglet(num_onglet, is_selected = false)
    html_a_rendre = "<div id='co_#{num_onglet}' class='mon_contenu'".html_safe
    if !is_selected
      html_a_rendre = html_a_rendre + "style='display: none;'>".html_safe
    end
    html_a_rendre = html_a_rendre + "<!--<Debut de l onglet #{num_onglet}-->".html_safe
    return html_a_rendre
   end
   
   def fin_contenu_onglet(num_onglet)
     return "</div> <!-- fin de l onglet #{num_onglet}-->".html_safe
   end
end
