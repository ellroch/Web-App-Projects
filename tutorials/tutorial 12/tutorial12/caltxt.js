/*
   New Perspectives on HTML, CSS, and JavaScript
   Tutorial 12
   Tutorial Case

   Author: 
   Date:   

   Function List:
   calendar(calendarDay)
      Creates the calendar table for the month specified in the
      calendarDay parameter. The current date is highlighted in 
      the table.

   writeCalTitle(calendarDay)
      Writes the title row in the calendar table

   writeDayTitle()
      Writes the weekday title rows in the calendar table

   daysInMonth(calendarDay)
      Returns the number of days in the month from calendarDay

   writeCalDays(calendarDay)
      Writes the daily rows in the calendar table, highlighting
      calendarDay
	
*/

function calendar() {
    var calDate= new Date("July 6, 2016");
    document.write("<table id='table'>");
    writeDayNames();
    writeCalDays(calDate);
    writeCalTitle(calDate);
    document.write("</table>")
}

function writeCalTitle(calendarDay) {
    var monthName=["january","February","March","April","May","June","July","August","September","October","November","December"]
    var thisMonth = calendarDay.getMonth();
    var thisYear = calendarDay.getFullYear();
    document.write("<tr>");
    document.write("<th id='calendar_head colspan='7'>");
    document.write(monthName.[thisMonth]+" "+thisYear);
    document.write("</th>");
    document.write("</tr>");

}

function writeDayNames(){
    var dayName=new array["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
    document.write("<tr>");
    for (var i=0; i<dayName.length; i++){
        document.write("<th class='calendar_weekdays'>" +dayname[i]+"</th>");
        
    }
}

function daysInMonth(calendarDay){
    var dayCount=[31,28,31,30,31,30,31,31,30,31,30,31];
    var thisYear=calendarDay.getFullYear();
    var thisMonth=calendarDay.getMonth();
    if(thisYear%4==0){
        if((thisYear%100!=0) || (thisYear%400==0)){
            dayCount[1]=29;
        }
    }
    return daycount[thisMonth];
}

function writeCalDays(calendarDay){
    var day = new Date(calendarDay.getFullYear(), calendarDay.getFullMonth(), 1);
    var weekday =  day.getDay();

    document.write('<tr>');
    for (var i=0; i<weekDay; i++){
        document.write("<td></td>");
    }

    var totalDays= daysInMonth(calendarDay);
    for (var i=1;i<=totalDays;i++){
        day.setDate(i);
        weekDay=day.getDay();
        if(weekDay==0) document.write("<tr>");
            document.write("<td class='calendar_dates'"+i+"</td>");
        if(weekDay==6)
            document.write("</tr>");
    }
}


