# encoding: UTF-8
module ApplicationHelper
  # Return a title on a per-page basis.
   def title(page_title = "iKiné", show_title = true)
     base_title = "iKiné"
     @content_for_title = page_title.to_s
     @show_title = show_title
     if @title.nil?
       base_title
     else
       "#{base_title} | #{@title}"
     end
   end
   
   #methode pour charger le logo
   def logo options = {}
      fichier = options[:fichier].nil? ? "iKine.png" : options[:fichier]
      alt = options[:alt].nil?  ? "" : options[:alt]
      classe = options[:classe].nil? ? "" : options[:classe]
      height = options[:height].nil? ? "" : options[:height]
      #fichier="iKine.png", height ="90", alt=""  
      image_tag( fichier, :alt => alt, :class => "round",  :height=> height) #Permet de charger le logo
   end
   
   #methode qui permet de générer un lien qui fait un tri sur la colonne column avec pour champ titl
   def sortable(column, title = nil)
      title ||= column.titleize
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc" 
      css_class = column == sort_column ? "current #{sort_direction}" : nil
      return link_to title, params.merge(:sort =>column ,:direction => direction , :page=>nil), {:class => css_class}
   end
   
   ###############################
   ## METHODES POUR LES ONGLETS ##
   ###############################
   
   ###############################
   ### Pour les onglets desktops##
   ###############################
   
   #Methode qui permet de generer des onglets portant le nom de ceux presents dans le tableau qu'on passe en parametre
   #par defaut on prend le premier
   #  -onglets est un tableau de string qui contient le nom de chaque onglets
   #  -selected est le numero de l'onglet qu'on veut sélectionner
   def kine_onglets(onglets, selected = 1)
     html_a_rendre = "
       <div id='mes_onglets' class='centrage button-group'>
    		  <ul class='button-group' >".html_safe
      i = 1
     onglets.each do |onglet|
      if i == selected
        html_a_rendre = html_a_rendre+"<li id='o_#{i}' class='mon_onglet_selected' onclick='changeOnglet(this);'><a href='#' class='button primary'>#{onglet}</a></li>".html_safe
      else
        html_a_rendre = html_a_rendre+"<li id='o_#{i}' class='mon_onglet' onclick='changeOnglet(this);'><a href='#' class='button'>#{onglet}</a></li>".html_safe
      end
      i=i+1
     end
     html_a_rendre = html_a_rendre+"
     	  </ul>
     	  <div class='clear'></div>
      </div>
     ".html_safe
    return html_a_rendre
   end
   
   #Methode a appeler avant de commencer a faire les contenus des onglets
   def kine_debut_contenu_onglets
    return 	"<div id='mes_contenus'> <!-- Debut des onglets-->".html_safe
   end
   
   #Methode a appeler une fois qu'on a fini d'éditer les contenus des onglets
   def kine_fin_contenu_onglets
    return "</div> <!-- fin des onglet-->".html_safe
   end
   
   #methode qui permet de commencer le contenu d'un onglet 
   #  -num_onglet est le numero de l'onglet qu'on veut définir 
   #  -is_selected est un boolen qui dit signifie que l'onglet est actif ou non (par defaut il est inactif)
   def kine_debut_contenu_onglet(num_onglet, is_selected = false)
    html_a_rendre = "<div id='co_#{num_onglet}' class='mon_contenu'".html_safe
    if !is_selected
      html_a_rendre = html_a_rendre + "style='display: none;'>".html_safe
    end
    html_a_rendre = html_a_rendre + "<!--<Debut de l onglet #{num_onglet}-->".html_safe
    return html_a_rendre
   end
   
   #Methode à appeler à la fin du remplissage du contenu d'un onglet 
   def kine_fin_contenu_onglet(num_onglet)
     return "</div> <!-- fin de l onglet #{num_onglet}-->".html_safe
   end
   
   
   ##################################################################
   ### Pour les onglets Mobiles ( mêmes mathodes avec _m à la fin)###
   ##################################################################
   def kine_onglets_m(onglets, selected = 1)
      html_a_rendre = "
        <div data-role='tabs'> <!--Debut des onglets -->
     		  <ul>".html_safe
       i = 1
      onglets.each do |onglet|
       if i == selected
         html_a_rendre = html_a_rendre+"<li><a href='#tab-#{i}' class='ui-btn-active'>#{onglet}</a></li>".html_safe
       else
         html_a_rendre = html_a_rendre+"<li><a href='#tab-#{i}'>#{onglet}</a></li>".html_safe
       end
       html_a_rendre = html_a_rendre+" <!-- Onglet numero #{i} -->".html_safe
       i=i+1
      end
      html_a_rendre = html_a_rendre+"<div class='clear'></div>
      	  </ul>
       </div> <!-- Fin des onglets -->
      ".html_safe
     return html_a_rendre
    end

    #Methode a appeler avant de commencer a faire les contenus des onglets
    def kine_debut_contenu_onglets_m
     return 	"<div data-role ='content'> <!-- Debut des contenus des onglets-->".html_safe
    end

    #Methode a appeler une fois qu'on a fini d'éditer les contenus des onglets
    def kine_fin_contenu_onglets_m
     return "</div> <!-- fin des contenus des onglet-->".html_safe
    end

    #methode qui permet de commencer le contenu d'un onglet 
    #  -num_onglet est le numero de l'onglet qu'on veut définir 
    def kine_debut_contenu_onglet_m num_onglet
      "<div id='tab-#{num_onglet}' <!--<Debut de l onglet #{num_onglet}-->".html_safe
    end

    #Methode à appeler à la fin du remplissage du contenu d'un onglet 
    def kine_fin_contenu_onglet_m num_onglet
      return "</div> <!-- fin de l onglet #{num_onglet}-->".html_safe
    end
   
   ######################################
   ## FIN DESMETHODES POUR LES ONGLETS ##
   ######################################
   
   
   def kine_autocomplete_fied_edit(f, nom , pre = false, display = false, readonly = false)
     head = "<div class=\"field\">"
     label = getLabel(f, nom, display)
     if pre
        field = "#{f.text_field nom , :disabled => readonly, "data-pre" => [pre].to_json }"
     else
        field = "#{f.text_field nom , :disabled => readonly }"
     end
     print("\n\n#{field}\n\n")
     #field = "#{f.send(:text_field, nom)}"# TODO : Audric : Mettre en place un systeme d'invocation basé la dessus ...
     tail = "</div>"
     resultat = head + label + field + tail
     
     puts "_________________________"
     puts resultat.html_safe
     puts "_________________________"
     
          return resultat.html_safe
   end
   
   

   
   
   def kine_text_fied_edit(f, nom , display = false, readonly = false)
     head = "<div class=\"field\">"
     label = getLabel(f, nom, display)
     field = "#{f.text_field nom , :disabled => readonly}"
     print("\n\n#{field}\n\n")
     #field = "#{f.send(:text_field, nom)}"# TODO : Audric : Mettre en place un systeme d'invocation basé la dessus ...
     tail = "</div>"
     resultat = head + label + field + tail
     return resultat.html_safe
   end
   
   def kine_mail_fied_edit(f, nom , display = false, readonly = false)
     head = "<div class=\"field\">"
     label = getLabel(f, nom, display)
     field = "#{f.email_field nom, :disabled => readonly}"
     tail = "</div>"
     resultat = head + label + field + tail
     return resultat.html_safe
   end


   def kine_telephone_fied_edit(f, nom , display = false, readonly = false)
     head = "<div class=\"field\">"
     label = getLabel(f, nom, display)
     field = "#{f.telephone_field nom, :disabled => readonly}"
     tail = "</div>"
     resultat = head + label + field + tail
     return resultat.html_safe
   end


   def kine_collection_select_edit(f, champ_de_f , champ_id_de_f , collection , champ_id_collection , champ_collection_display , display = false, readonly = false)
     head = "<div class=\"field\">"
     label = getLabel(f, champ_de_f, display)
     field = "#{f.collection_select(champ_id_de_f , collection , champ_id_collection , champ_collection_display,  {}, {:disabled => readonly})}"
     tail = "</div>"
     resultat = head + label + field + tail
     return resultat.html_safe
   end

#Don't wrk
		#def kine_ , ,: ,:select_edit(f, champ_de_f,  collection , display = false, readonly = false)
     # head = "<div class=\"field\">"
      #label = getLabel(f, champ_de_f, display)
      #field = "#{f.select champ_de_f,"
      #for
      #field+= ",  {}, {:disabled => readonly})}"
      #tail = "</div>"
      #resultat = head + label + field + tail
      #return resultat.html_safe
    #end




  def getLabel(f, nom, display) # Cette méthode ne commence pas par "kine_" car elle n'est pas sencée être utilisée ailleurs que dans ce fichier.
      label =  if(display) then "<strong>#{display}</strong>"  else "#{f.label nom}" end
      return label
  end
  
#  def getFieldModeView(f , nom ) # Cette méthode ne commence pas par "kine_" car elle n'est pas sencée être utilisée ailleurs que dans ce fichier.
#      return f.send(nom)
#  end

  def kine_display_view(label, display = false) # Cette méthode ne commence pas par "kine_" car elle n'est pas sencée être utilisée ailleurs que dans ce fichier.
    return "<strong>#{label}</strong> #{display}".html_safe
   end

   def iphone_icon(options)
     options[:rel] = 'apple-touch-icon'
     options[:rel] += '-precomposed' if options[:precomposed]
     options[:precomposed] = nil if options[:precomposed]
     options[:href] = image_path(options[:href])
     [:link, options]
   end
end



