// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
/**
*Fonction pour changer les onglets
* @see http://www.johnstyle.fr/langage/javascript/creer-des-onglets-facilement/
*/
function changeOnglet(_this){
	var getOnglets 	= document.getElementById('mes_onglets').getElementsByTagName('li');
	var getLiens 	= document.getElementById('mes_onglets').getElementsByTagName('a');
	for(var i = 0; i < getOnglets.length; i++){
		if(getOnglets[i].id){
			if(getOnglets[i].id == _this.id){
				getOnglets[i].className = 'mon_onglet_selected';
				getLiens[i].className = 'button primary';
				document.getElementById('c' + _this.id).style.display 			= 'block';
			}
			else{
				getOnglets[i].className = 'mon_onglet button';
				getLiens[i].className = 'button';
				document.getElementById('c' + getOnglets[i].id).style.display 	= 'none';
			}
		}
	}			
}

/**
*Fonction pour faire des liens ajax sur les tablaux tri etc et la barre de recherche
*/
$(function() {
	/*Cette fonction sert à récupérer les clicks sur des liens de la page ici
	* sur les titres des colonnes pour le tri et sur les éléments pour la pagination
	*/
  $("#ordonnances th a, #ordonnances .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  /*Celui ci sert à chopper les recherches quand on click sur rechercher*/
  $("#ordonnances_search").submit(function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });

	/** Cette fonction permet de faire comme sur google de la instant recherche à voir si on la remplace 
	* par un plugin. 
	* @see http://plugins.jquery.com/plugin-tags/live-search
	*/
  $("#ordonnances_search input").keyup(function() {
    $.get($("#ordonnances_search").attr("action"), $("#ordonnances_search").serialize(), null, "script");
    return false;
  });
});

/**
 *Cette fonction sert à avoir l'auto-complétion pour un formulaire multi-liaison user ordonnance
 */
$(function() {
  $("#ordonnance_user_tokens").tokenInput("/users.json", {
    crossDomain: false,
    prePopulate: $("#ordonnance_user_tokens").data("pre"),
    //theme: "mac",
	preventDuplicates: true
	/*tokenLimit: 2 le nombre max qu'on autorise*/
  });
});

/**
 *Cette fonction sert à avoir l'auto-complétion pour un formulaire simple-liaison ordonnance patient
 */
$(function() {
  $("#ordonnance_patient_token").tokenInput("/patients.json", {
    crossDomain: false,
    prePopulate: $("#ordonnance_patient_token").data("pre"),
    //theme: "mac",
	tokenLimit: 1,
	preventDuplicates: true/* le nombre max qu'on autorise*/
  });
});
/**
 *Cette fonction sert à avoir l'auto-complétion pour un formulaire simple-liaison user patient
 */
$(function() {
  $("#ordonnance_medecin_token").tokenInput("/medecins.json", {
    crossDomain: false,
    prePopulate: $("#ordonnance_medecin_token").data("pre"),
    //theme: "mac",
	tokenLimit: 1,
	preventDuplicates: true/* le nombre max qu'on autorise*/
  });
});

/**
 *Cette fonction sert à avoir l'auto-complétion pour un formulaire simple-liaison patient seance
 */
$(function() {
  $("#seance_patient_token").tokenInput("/patients.json", {
    crossDomain: false,
    prePopulate: $("#seance_patient_token").data("pre"),
    //theme: "mac",
	tokenLimit: 1,
	preventDuplicates: true/* le nombre max qu'on autorise*/
  });
});

/**
 *Cette fonction sert à avoir l'auto-complétion pour un formulaire simple-liaison user seance
 */
$(function() {
  $("#seance_user_token").tokenInput("/users.json", {
    crossDomain: false,
    prePopulate: $("#seance_user_token").data("pre"),
    //theme: "mac",
	preventDuplicates: true,
	tokenLimit: 1 /*le nombre max qu'on autorise*/
  });
});

/**
 *Cette fonction sert à avoir l'auto-complétion pour un formulaire simple-liaison ordonnance seance
 */
$(function() {
  $("#seance_ordonnance_token").tokenInput("/ordonnances.json", {
    crossDomain: false,
    prePopulate: $("#seance_ordonnance_token").data("pre"),
    //theme: "mac",
	preventDuplicates: true,
	tokenLimit: 1 /*le nombre max qu'on autorise*/
  });
});

/**
 *Cette fonction sert à avoir l'auto-complétion pour un formulaire simple-liaison ordonnance rdv
 */
$(function() {
  $("#rdv_ordonnance_token").tokenInput("/ordonnances.json", {
    crossDomain: false,
    prePopulate: $("rdv_ordonnance_token").data("pre"),
    //theme: "mac",
	preventDuplicates: true,
	tokenLimit: 1 /*le nombre max qu'on autorise*/
  });
});
/**
 *Cette fonction sert à avoir l'auto-complétion pour un formulaire simple-liaison ordonnance bilan
 */
$(function() {
  $("#bilan_ordonnance_token").tokenInput("/ordonnances.json", {
    crossDomain: false,
    prePopulate: $("#bilan_ordonnance_token").data("pre"),
    //theme: "mac",
	preventDuplicates: true,
	tokenLimit: 1 /*le nombre max qu'on autorise*/
  });
});
/*Date Picker*/
//Il faut avoir un id date picker pour que ça fonctionne
$(function() {
	$( ".datepicker" ).datepicker({
				
			}
		);
});