/*
   New Perspectives on HTML5, CSS, and JavaScript
   Tutorial 13
   Case Problem 2

   Author:   
   Date:     

   Filename: translate.js


   Function List:


   setup()
      Insert the current week's french phrases into document and set up
      event handlers for the phrases.

   showEnglish()
      Changes all of the English phrases to French

   showFrench()
      Changes all of the French phrases to English

*/

window.onload = setup;
//document.onload = setup(); //throw no error... but nothing is being run.... so :(

function setup(){
    var questions = document.querySelectorAll("ol li");
    for (i = 0; i < questions.length; i++) {
        questions[i].id = i + "phrase";
        questions[i].onmousedown = showEnglish;
        questions[i].onmouseup = showFrench;
       // questions[i].onmouseover = this.style.cursor='pointer';
    }

}

function showEnglish(){
    var phraseNumber = parseInt(this.id);
    this.innerHTML = english[phraseNumber];
    this.style.fontStyle = "italic";
    this.style.fontColor = "rgb(191,22,31)";
}

function showFrench(){
    var phraseNumber = parseInt(this.id);
    this.innerHTML = french[phraseNumber];
    this.style.fontStyle = 'initial';
    this.style.color = "initial";
    //this.removeAttribute("Style");
    //this.removeAttribute("fontColor");
}
