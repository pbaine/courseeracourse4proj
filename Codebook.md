# Codebook

This is the codebook which describes the variables created in the courseera course 4 project. 

The tidy data which modifies the raw data is stored in courseera_course4proj.csv. This modifies the UCI HAR dataset which analyses human activity recogition using smartphones. The data tests the movement of 30 subjects performing six activities. The data, as described by the researchers (who understand this far better than me):

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

The data was sorted, filtered to include only mean and standard deviation measurements, and summarized, which is what is presented in the final courseera_course4proj.csv. The names were modified to be more descriptive of the activity. The final list of variables are:

 [1] "subject"                                    "label"                                     
 [3] "time-body-acceleration-mean-X"              "time-body-acceleration-mean-Y"             
 [5] "time-body-acceleration-mean-Z"              "time-body-acceleration-std-X"              
 [7] "time-body-acceleration-std-Y"               "time-body-acceleration-std-Z"              
 [9] "time-gravity-acceleration-mean-X"           "time-gravity-acceleration-mean-Y"          
[11] "time-gravity-acceleration-mean-Z"           "time-gravity-acceleration-std-X"           
[13] "time-gravity-acceleration-std-Y"            "time-gravity-acceleration-std-Z"           
[15] "time-body-acceleration-jerk--mean-X"        "time-body-acceleration-jerk--mean-Y"       
[17] "time-body-acceleration-jerk--mean-Z"        "time-body-acceleration-jerk--std-X"        
[19] "time-body-acceleration-jerk--std-Y"         "time-body-acceleration-jerk--std-Z"        
[21] "time-body-gyro-mean-X"                      "time-body-gyro-mean-Y"                     
[23] "time-body-gyro-mean-Z"                      "time-body-gyro-std-X"                      
[25] "time-body-gyro-std-Y"                       "time-body-gyro-std-Z"                      
[27] "time-body-gyro-jerk-mean-X"                 "time-body-gyro-jerk-mean-Y"                
[29] "time-body-gyro-jerk-mean-Z"                 "time-body-gyro-jerk-std-X"                 
[31] "time-body-gyro-jerk-std-Y"                  "time-body-gyro-jerk-std-Z"                 
[33] "time-body-acceleration-magnitude-mean"      "time-body-acceleration-magnitude-std"      
[35] "time-gravity-acceleration-magnitude-mean"   "time-gravity-acceleration-magnitude-std"   
[37] "time-body-acceleration-jerk-Mag-mean"       "time-body-acceleration-jerk-Mag-std"       
[39] "time-body-gyro-magnitude-mean"              "time-body-gyro-magnitude-std"              
[41] "time-body-gyro-jerk-magnitude-mean"         "time-body-gyro-jerk-magnitude-std"         
[43] "frequency-body-acceleration-mean-X"         "frequency-body-acceleration-mean-Y"        
[45] "frequency-body-acceleration-mean-Z"         "frequency-body-acceleration-std-X"         
[47] "frequency-body-acceleration-std-Y"          "frequency-body-acceleration-std-Z"         
[49] "frequency-body-acceleration-jerk--mean-X"   "frequency-body-acceleration-jerk--mean-Y"  
[51] "frequency-body-acceleration-jerk--mean-Z"   "frequency-body-acceleration-jerk--std-X"   
[53] "frequency-body-acceleration-jerk--std-Y"    "frequency-body-acceleration-jerk--std-Z"   
[55] "frequency-body-gyro-mean-X"                 "frequency-body-gyro-mean-Y"                
[57] "frequency-body-gyro-mean-Z"                 "frequency-body-gyro-std-X"                 
[59] "frequency-body-gyro-std-Y"                  "frequency-body-gyro-std-Z"                 
[61] "frequency-body-acceleration-magnitude-mean" "frequency-body-acceleration-magnitude-std" 
[63] "frequency-body-acceleration-jerk-Mag-mean"  "frequency-body-acceleration-jerk-Mag-std"  
[65] "frequency-body-gyro-magnitude-mean"         "frequency-body-gyro-magnitude-std"         
[67] "frequency-body-gyro-jerk-magnitude-mean"    "frequency-body-gyro-jerk-magnitude-std"  

The means were calculated for each test subject and activity (walking, laying, sitting, standing, walking_downstairs, walking_upstairs)