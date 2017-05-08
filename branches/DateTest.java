package com.devweb.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateTest {

	public static void main(String[] args) {
		DateTest d = new DateTest();
		d.input();

	}
	
	public void input(){
		boolean isValid= false;
		Date d1= new Date();
		Date d2= addMonthAndDays(d1,0,8);
		Integer[] diffPrint = null;
		Integer month;
		Integer days;
		try {
			diffPrint = doGetMonthDaysDiff(d2, d1);
		} catch (ParseException e) {
			System.out.println("Exception in input()");
		}
		
		if(null!=diffPrint){
			month = diffPrint[0];
			days=diffPrint[1];
			if(null!=month && null!=days){
				if(month>=1 && days>=0 ){
					isValid=true;
					printData(month,days,String.valueOf(isValid));
				}else{
					isValid=false;
					printData(month,days,String.valueOf(isValid));
				}
			}else if(null!=month){
				if(month>1){
					isValid=true;
					printData(month,days,String.valueOf(isValid));
				}else{
					isValid=false;
					printData(month,days,String.valueOf(isValid));
				}
				
			}
			
		}else{
			System.out.println("diffPrint = "+diffPrint);
		}
		
		
	}
	
	public void printData(Integer a, Integer b,String s){
		if(null!=a & null!=b){
			System.out.println("Months = "+a+" days ="+b);
		}
		if(null!=s){
			System.out.println("IsValid = "+s);
		}
		
			
	}
	
	public static Date addMonthAndDays(Date date,int noOfMonths,int noOfDays)
	{
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(date);
	    int strDate = cal.get(cal.DAY_OF_MONTH);
	    strDate =strDate+noOfDays;
	    cal.add(Calendar.MONTH, noOfMonths);
	    cal.add(Calendar.DATE, noOfDays);
	    return cal.getTime();
	}
	
	public Integer[] doGetMonthDaysDiff(Date d1,Date d2) throws ParseException{
   	 SimpleDateFormat formatter= new SimpleDateFormat("dd-MM-yyyy");
   	    String CURRDATE    = "08-02-2016";
   	    String EFFDATE     = "02-02-2017";   

   	    Date startdate = d2;//formatter.parse(CURRDATE);
   	    Date enddate   = d1;//formatter.parse(EFFDATE);

   	    Calendar startCalendar = new GregorianCalendar();
   	    startCalendar.setTime(startdate);

   	    Calendar endCalendar = new GregorianCalendar();
   	    endCalendar.setTime(enddate);

   	    int monthCount = 0;
   	    int firstDayInFirstMonth = startCalendar.get(Calendar.DAY_OF_MONTH);
   	    startCalendar.set(Calendar.DAY_OF_MONTH, 1);
   	    endCalendar.add(Calendar.DAY_OF_YEAR, -firstDayInFirstMonth+1);

   	    while (!startCalendar.after(endCalendar)) {     
   	        startCalendar.add(Calendar.MONTH, 1);
   	        ++monthCount;
   	    }

   	    startCalendar.add(Calendar.MONTH, -1); --monthCount;
   	    int remainingDays = 0;
   	    while (!startCalendar.after(endCalendar)) {
   	        startCalendar.add(Calendar.DAY_OF_YEAR, 1);
   	        ++remainingDays;
   	    }

   	    startCalendar.add(Calendar.DAY_OF_YEAR, -1);
   	    --remainingDays;

   	    int lastMonthMaxDays = endCalendar.getActualMaximum(Calendar.DAY_OF_MONTH);
   	    if (remainingDays >= lastMonthMaxDays) {
   	        ++monthCount;
   	        remainingDays -= lastMonthMaxDays;
   	    }

   	    int diffMonth = monthCount; 
   	    int diffDay = remainingDays; 
   	    Integer[] monthAndDay ={diffMonth,diffDay};

   	   // System.out.println("diffMonth==="+diffMonth +" Month(s) and " + diffDay + " Day(s)");
   	    return monthAndDay;
   }

}
