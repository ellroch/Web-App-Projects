/*
   New Perspectives on HTML5, CSS, and JavaScript
   Tutorial 14
   Case Problem 1

   Author: 
   Date:   

   Filename: stylebox.js

   Global Variables:
   allSheets
      Array of all preferred and alternative style sheets in the document


   Functions List:
   loadStyles()
      Populates the allSheets array, disables the alternate
      style sheets, and calls the displayThumbs() function to create
      thumbnail images of the style sheets.

   displayThumbs()
      Creates inline images that preview each style sheet, adds event handlers
      to each image to load a different style sheet when clicked.

   showSheet() 
      Loads a style sheet based on the thumbnail image that was clicked.

*/
var allSheets = [0];

document.onload(loadStyles());

function loadStyles() {
    var links = document.getElementsByTagName("link");
    var arr_len = links.length;
    for (var i = 0; i < arr_len; i++){
        if (links[i].type=="text/css"){
            if (links[i].rel=="alternate stylesheet"){
                void (links[i].rel.disabled = "true");
            }
            allSheets.push(links[i]);
        }
    }
    displayThumbs();
}

function displayThumbs() {
    var figBox = document.createElement("figure");
    figBox.id = "thumbnails";
    for (var i = 0; i < allSheets.length; i++) {
        sheetImg = document.createElement("img");
        sheetImg.href = allSheets[i].title + "_small.png";
        sheetImg.title = allSheets[i].title;
        sheetImg.onclick = "showSheet()";
        figBox.append(sheetImg);
    }
    document.getElementById("main").append(figBox);
}

function showSheet() {
    var sTitle = this.title;
    for (i = 0; i < allSheets.length; i++){
        if (allSheets[i].title = sTitle) {
            allSheets[i].disabled = false;
        }
        else {
            allSheets[i].disabled = true;
        }
    }
}


