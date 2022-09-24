"use strict";

const radioAchat = document.getElementById("achat");
const radioVente = document.getElementById("vente");
const listeCkboxAchat = document.querySelectorAll(".achats");
const listeCkboxVente = document.querySelectorAll(".ventes");

if (radioAchat && radioVente) {
	if (radioAchat.attributes.checked.specified == true) {
		disable(listeCkboxVente);
	}
	else {
		disable(listeCkboxAchat);
	}
	radioAchat.addEventListener("change", onRadioChange);
	radioVente.addEventListener("change", onRadioChange);
}

function onRadioChange(e) {
	if (e.target.value == "achat") {
		enable(listeCkboxAchat);
		disable(listeCkboxVente);
	} 
	else {
		enable(listeCkboxVente);
		disable(listeCkboxAchat);
	}
}

function disable(listeCkbox) {
	listeCkbox.forEach((box) => {
		box.setAttribute("disabled", "");
		box.parentElement.classList.add("disabled");
	})
}

function enable(listeCkbox) {
	listeCkbox.forEach((box) => {
		box.removeAttribute("disabled");
		box.parentElement.classList.remove("disabled");
	})
}
