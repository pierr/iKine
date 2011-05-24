// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
/**
*Fonction pour changer les onglets
* @see http://www.johnstyle.fr/langage/javascript/creer-des-onglets-facilement/
*/
function changeOnglet(_this){
	var getOnglets 	= document.getElementById('mes_onglets').getElementsByTagName('li');
	for(var i = 0; i < getOnglets.length; i++){
		if(getOnglets[i].id){
			if(getOnglets[i].id == _this.id){
				getOnglets[i].className = 'mon_onglet_selected';
				document.getElementById('c' + _this.id).style.display 			= 'block';
			}
			else{
				getOnglets[i].className = 'mon_onglet';
				document.getElementById('c' + getOnglets[i].id).style.display 	= 'none';
			}
		}
	}			
}

/**
*Fonction pour faire des liens ajax sur les tablaux tri etc et la barre de recherch
*/
$(function() {
  $("#ordonnances th a, #ordonnances .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  
  $("#ordonnances_search").submit(function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });

  $("#ordonnances_search input").keyup(function() {
    $.get($("#ordonnances_search").attr("action"), $("#ordonnances_search").serialize(), null, "script");
    return false;
  });
});