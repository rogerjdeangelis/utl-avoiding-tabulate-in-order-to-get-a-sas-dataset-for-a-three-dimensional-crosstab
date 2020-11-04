Avoiding tabulate in order to get a sas dataset for a three dimensional crosstab                                                        
                                                                                                                                        
    Two solutions                                                                                                                       
    =============                                                                                                                       
                                                                                                                                        
         a. Tabulate (no conformal dataset possible)                                                                                    
            Draycut                                                                                                                     
            https://stackoverflow.com/users/4044936/draycut                                                                             
                                                                                                                                        
         b. CORRESP crosstab output sas dataset                                                                                         
                                                                                                                                        
GitHub                                                                                                                                  
https://cutt.ly/igDCisr                                                                                                                 
https://github.com/rogerjdeangelis/utl-avoiding-tabulate-in-order-to-get-a-sas-dataset-for-a-three-dimensional-crosstab                 
                                                                                                                                        
Stackoverflow                                                                                                                           
https://cutt.ly/cgDXZwn                                                                                                                 
https://stackoverflow.com/questions/64551205/how-to-get-a-frequency-table-with-2-variable-in-rows-and-1-in-column                       
                                                                                                                                        
*                                                                                                                                       
#####  #   #  ####   #   #  #####                                                                                                       
  #    ##  #  #   #  #   #    #                                                                                                         
  #    # # #  #   #  #   #    #                                                                                                         
  #    #  ##  ####   #   #    #                                                                                                         
  #    #   #  #      #   #    #                                                                                                         
  #    #   #  #      #   #    #                                                                                                         
#####  #   #  #       ###     #                                                                                                         
                                                                                                                                        
#! INPUT ;                                                                                                                              
                                                                                                                                        
data have;                                                                                                                              
input a b c;                                                                                                                            
datalines;                                                                                                                              
1 2 2                                                                                                                                   
2 3 1                                                                                                                                   
2 2 1                                                                                                                                   
3 1 2                                                                                                                                   
3 1 2                                                                                                                                   
;;;;                                                                                                                                    
run;quit;                                                                                                                               
                                                                                                                                        
WORK.HAVE total obs=5                                                                                                                   
                                                                                                                                        
  A    B    C                                                                                                                           
                                                                                                                                        
  1    2    2                                                                                                                           
  2    3    1                                                                                                                           
  2    2    1                                                                                                                           
  3    1    2                                                                                                                           
  3    1    2                                                                                                                           
                                                                                                                                        
*                                                                                                                                       
 ###   #   #  #####  ####   #   #  #####                                                                                                
#   #  #   #    #    #   #  #   #    #                                                                                                  
#   #  #   #    #    #   #  #   #    #                                                                                                  
#   #  #   #    #    ####   #   #    #                                                                                                  
#   #  #   #    #    #      #   #    #                                                                                                  
#   #  #   #    #    #      #   #    #                                                                                                  
 ###    ###     #    #       ###     #                                                                                                  
                                                                                                                                        
#####    #    ####   #   #  #        #    #####  #####                                                                                  
  #     # #    #  #  #   #  #       # #     #    #                                                                                      
  #    #   #   #  #  #   #  #      #   #    #    #                                                                                      
  #    #####   ###   #   #  #      #####    #    ####                                                                                   
  #    #   #   #  #  #   #  #      #   #    #    #                                                                                      
  #    #   #   #  #  #   #  #      #   #    #    #                                                                                      
  #    #   #  ####    ###   #####  #   #    #    #####                                                                                  
                                                                                                                                        
#! TABULATE ;                                                                                                                           
                                                                                                                                        
                                                                                                                                        
-------------------------------------------------------------------                                                                     
|                                        |            C            |                                                                    
|                                        |-------------------------|                                                                    
|                                        |     1      |     2      |                                                                    
|----------------------------------------+------------+------------|                                                                    
|A                  |B                   |            |            |                                                                    
|-------------------+--------------------|            |            |                                                                    
|1                  |2                   |           .|        1.00|                                                                    
|-------------------+--------------------+------------+------------|                                                                    
|2                  |2                   |        1.00|           .|                                                                    
|                   |--------------------+------------+------------|                                                                    
|                   |3                   |        1.00|           .|                                                                    
|-------------------+--------------------+------------+------------|                                                                    
|3                  |1                   |           .|        2.00|                                                                    
--------------------------------------------------------------------                                                                    
                                                                                                                                        
*                                                                                                                                       
 ###    ###   ####   ####   #####   ###   ####                                                                                          
#   #  #   #  #   #  #   #  #      #   #  #   #                                                                                         
#      #   #  #   #  #   #  #       #     #   #                                                                                         
#      #   #  ####   ####   ####     #    ####                                                                                          
#      #   #  # #    # #    #         #   #                                                                                             
#   #  #   #  #  #   #  #   #      #   #  #                                                                                             
 ###    ###   #   #  #   #  #####   ###   #                                                                                             
                                                                                                                                        
#! CORRESP ;                                                                                                                            
                                                                                                                                        
                                                                                                                                        
WORK.WANT total obs=5                                                                                                                   
                                                                                                                                        
   LABEL    _1    _2     SUM                                                                                                            
                                                                                                                                        
   1 * 2     0     1      1                                                                                                             
   2 * 2     1     0      1                                                                                                             
   2 * 3     1     0      1                                                                                                             
   3 * 1     0     2      2                                                                                                             
                                                                                                                                        
   Sum       2     3      5                                                                                                             
                                                                                                                                        
*                                                                                                                                       
 ###    ###   #      #   #  #####  #####   ###   #   #   ###                                                                            
#   #  #   #  #      #   #    #      #    #   #  ##  #  #   #                                                                           
 #     #   #  #      #   #    #      #    #   #  # # #   #                                                                              
  #    #   #  #      #   #    #      #    #   #  #  ##    #                                                                             
   #   #   #  #      #   #    #      #    #   #  #   #     #                                                                            
#   #  #   #  #      #   #    #      #    #   #  #   #  #   #                                                                           
 ###    ###   #####   ###     #    #####   ###   #   #   ###                                                                            
                                                                                                                                        
#! SOLUTIONS ;                                                                                                                          
                                                                                                                                        
                                                                                                                                        
TABULATE                                                                                                                                
========                                                                                                                                
                                                                                                                                        
proc tabulate data =  have;                                                                                                             
   class a b c;                                                                                                                         
   table a*b, c*n='';                                                                                                                   
run;                                                                                                                                    
                                                                                                                                        
CORRESP                                                                                                                                 
======                                                                                                                                  
                                                                                                                                        
ods output observed=want;                                                                                                               
proc corresp data=have dim=1 observed cross=both;                                                                                       
tables a b, c;                                                                                                                          
run;quit;                                                                                                                               
                                                                                                                                        
                                                                                                                                        
                                                                                                                                        
                                                                                                                                        
