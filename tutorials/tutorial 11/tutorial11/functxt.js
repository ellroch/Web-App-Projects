/*
   New Perspectives on HTML, CSS, and JavaScript
   Tutorial 11
   Tutorial Case

   Author: 
   Date:   

   Function List:
   showDate(dateObj)
      Returns the current date in the format mm/dd/yyyy

   showTime(dateObj)
      Returns the current time in the format hh:mm:ss a.m./p.m.

   calcDays(currentDate)
      Returns the number of days between the current date and January 1st
      of the next year

*/

/*returns the current date in the format of mm/dd/yyyy */
function showDate(dateObj) {
    thisDate = dateObj.getDate();
    thisMonth = dateObj.getMonth()+1;
    thisYear = dateObj.getFullYear();
    return thisMonth + "/" + thisDate + "/" + thisYear;
}

//returns the current time in format hh:mm:ss am/pm
function showTime(dateObj) {
    thisHour = dateObj.getHours();
    thisMinute = dateObj.getMinutes();
    thisSecond = dateObj.getSeconds();

    var ampm = (thisHour < 12) ? "a.m." : "p.m.";
    thisHour = (thisHour > 12) ? thisHour -12: thisHour;
    thisHour = (thisHour == 0) ? 12 : thisHour;

    thisMinute = (thisMinute < 10) ? "0" + thisMinute : thisMinute;
    thisSecond = (thisSecond < 10) ? "0" + thisSecond : thisSecond;

    return thisHour + ":" + thisMinute + ":" + thisSecond;
}

//returns the number of days until january 1
function calcDays(curentDate) {
    newYear = new Date("January 1, 2015,");
    nextYear = currentDate = getFullYear() + 1;
    newYear.setFullYear(nextYear)
    days = (newYear - currentDate) / (1000 * 60 * 60 * 24);
}












