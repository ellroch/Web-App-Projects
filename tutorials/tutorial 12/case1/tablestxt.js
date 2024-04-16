/*
   New Perspectives on HTML, CSS, and JavaScript
   Tutorial 12
   Case Problem 1

   Author:  Chris Glanzer 
   Date:     

   Filename: tables.js

   Function List:

   showTable()
      Shows a table of contributors to the Lighthouse

   showSummary()
      Shows a table summarizing the contributions made to the Lighthouse

*/

function showTable(){
    document.write("<table id='contributors'>");
    document.write("<thead>");
    document.write("<tr> ");
    document.write("<td>date</t>");
    document.write("<td class='amt'>amount</td>");
    document.write("<td>firstName</td>");
    document.write("<td>lastName</td>");
    document.write("<td>street <br />city, state zip</td>");
    document.write("</tr>");

    document.write("<tbody>");
    var listLen = firstName.length;
    var loopCount = 0;
    while (loopCount < listLen) {

        document.write("<tr> ");
        document.write("<td>"+date[loopCount]+"</t>");
        document.write("<td class='amt'>"+amount[loopCount]+"</td>");
        document.write("<td>"+firstName[loopCount]+"</td>");
        document.write("<td>"+lastName[loopCount]+"</td>");
        document.write("<td>" + street[loopCount] + " <br />" + city[loopCount] + ", " + state[loopCount] + " " + zip[loopCount] + "</td>");
        document.write("</tr>");
        loopCount++;
    }
    
    document.write("</tbody>");
    document.write("</table>")
};

function showSummary(){
    var total = 0;

    var listLen = amount.length;
    var counter = 0;
    while (counter < listLen) {
        total += amount[counter];
        counter++;
    }

    document.write("<table id='sumTable>");
    document.write("<tr>");
    document.write("<th id=sumTitle colspan='2'>Summary</th>");
    document.write("</tr>");
    document.write("<tr>");
    document.write("<th>Contributors</th>");
    document.write("<td>"+listLen+"</td>");
    document.write("</tr>");
    document.write("<tr>");
    document.write("<th>Amount</th>");
    document.write("<td>$"+total+"</td>");
    document.write("</tr>");
    document.write("</table>");

};
