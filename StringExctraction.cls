public with sharing class StringExctraction {
  
    public static String exctractData(String inputString)
    {     
        try {
            List<String> item;
            String finalString;
            if(inputString !=null)
            {
                item = inputString.split(' ');
            }
            for(String s: item)
            {               
                if(s.contains(','))
                {
                    finalString = exctractSubData(s);
                }
                else{
                    finalString += ' '+ s;
                }
            }
            System.debug('23:: FINAL STRING RESULT:: '+ finalString);
            return finalString;
        } catch (Exception ex) {
            System.debug('19::error:: '+ ex);
            throw ex;            
        }             
    }   
    // INPUT:: StringExctraction.exctractData('7985923,DANNY SOLUTIONS PVT LIMITED');
    //OUTPUT:: 01:06:34:020 USER_DEBUG [23]|DEBUG|23:: FINAL STRING RESULT::  7985923 DANNY SOLUTIONS PVT LIMITED

 private static String exctractSubData(String input)
 {
        try {
            List<String> splitResult;          
            String pattern1= '^[a-zA-Z0-9]+,[a-zA-Z]+$';
            Pattern stringPatternMatch = Pattern.compile(pattern1);
            Boolean isStringPatternMatch = stringPatternMatch.matcher(input).matches();
            System.debug('38:: '+ isStringPatternMatch);
            if(input.contains(',') && isStringPatternMatch )
            {
                System.debug('9:: string contains , ');
                splitResult = input.split(',');
            }
            else{
                System.debug('13:: string doesnt contains , ');
            }            
            System.debug(splitResult);      
            String stringResult ='';
            if(splitResult != null )
            {
                for(integer i=0; i<splitResult.size();i++)
                {
                    stringResult += ' '+ splitResult[i];
                }
            }            
            System.debug('58:: '+ stringResult);
            return stringResult;            
        } catch (Exception ex) {
            System.debug('8::error:: '+ ex);
            throw ex;            
        }
 }
}