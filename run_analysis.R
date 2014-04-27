
# from the appropriate working directory or directories 
# (adjust working directory as necessary)
# create data frames for test data versions of subject, 
# test set and test labels
subj_test = read.table("subject_test.txt")
x_test = read.table("X_test.txt")
y_test = read.table("y_test.txt")

#create data frames for training data versions of subject, 
# training set and training labels
subj_train = read.table("subject_train.txt")
x_train = read.table("X_train.txt")
y_train = read.table("y_train.txt")

#create data frames containing the activity labels and features
activity_labels = read.table("activity_labels.txt")
features = read.table("features.txt")

##Merge all data into a single data set
##Take care to merge "test" and "train" versions in the
##same order across "y", "x" and "subj"
#merge "y" data frames into one data frame
y_all = rbind(y_test,y_train)

#merge "x" data frames into one data frame
x_all = rbind(x_test,x_train)

#merge "subject" data frames into one data frame
subj_all = rbind(subj_test,subj_train)

#clean-up
rm(y_test,y_train,x_test,x_train,subj_test,subj_train)

##Create descriptive column names
colnames(x_all) = as.character(features[[2]])
colnames(y_all)=c("class_labels")
colnames(subj_all)=c("subject_labels")


##Combine "all" data frames into single data frame
##create character versions of "subj_all" and "y_all" data frames
subj_all_char = as.data.frame(as.character(subj_all[[1]]))
y_all_char = as.data.frame(as.character(y_all[[1]]))
all_data_tmp = cbind(subj_all_char,y_all_char,x_all)
#clean-up
rm(subj_all_char,subj_all,y_all_char,y_all,x_all)

##match-merge class labels to activity names in "all_data"
all_data = merge(activity_labels,all_data_tmp,by.x="V1",by.y="class_labels",sort=FALSE)
#create new column name for "V2" after merge
colnames(all_data)[2] = c("activity_names")
#drop the "class_labels"
all_data = all_data[-c(1)]
#clean-up
rm(all_data_tmp)

##convert subject_labels and activity_names to factors
all_data$subject_labels = as.factor(all_data$subject_labels)
all_data$activity_names = as.factor(all_data$activity_names)

##isolate "mean" and "sd" variables
#create regexp vector to locate mean and sd variables
match_regexp = c("mean\\(\\)", "std\\(\\)")
#get values returned and check
matches = unique (grep(paste(match_regexp,collapse="|"),features$V2,value=TRUE))
#get matching indices and add 2 in order to account 
#for additional columns in all_data
matchesind = unique (grep(paste(match_regexp,collapse="|"),features$V2)) + 2
#add "1" and "2" indexes to matchesind
colinds = c(1,2,matchesind)

##Create sub set of only "mean" and "std" variables
##by subsetting target columns as new data frame
all_data_ms = all_data[colinds]
#clean-up
rm(colinds,match_regexp,matches,matchesind)

##Calculate averages over variables by subject and activity
#create "molten" data frame to ease task
molten.ds = melt(all_data_ms,id = c("activity_names","subject_labels"))
#create data frame containing average values for all "mean" and "sd" 
#variables by subject and activity
tidy_data = dcast(molten.ds,formula=activity_names+subject_labels~variable,mean)

##Write tidy_data to a flat file
write.table(tidy_data, file="./tidydata.txt", sep="\t", row.names=FALSE)
