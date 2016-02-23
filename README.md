# Matrix Columns invert Workflow
![myimage-alt-tag](https://github.com/WorkflowCenter-Repositories/Columns-Invert-WF/raw/master/random.jpg)
  
Columns invert is a simple workflow for inverting the columns of a given csv file.  
  
  WF-Title: Random    
  version: 1.0    
  Description: a simple workflow for inverting the columns of a given csv file.  
  
###WF-Tasks:  
  
  No-of-tasks: 7  
  Tasks: {CSVimport: 1, Sleep: 2, ZipFile: 1, Col-invert: 1, CSV_export: 1, ExportFiles: 1}  
  Dependency-Libs: {java1.7: all}   

###Blueprint:

  blueprint-name: Random.yaml  
  Docker-images: rawa/col-invert1  
  sizes: 268 MB (Virtual size 594.6 MB)  
  OS-types: ubuntu14.4  
  tools: Java1.7  
  
###Input:  
  
  input-file:  file.csv    
  description: input file
  types: csv

###Outputs:

  output-folder: '~/blueprint-name'  
  output-file(s): {'}  
  description:  Two output files for the inverted csv and a zipped csv file
  types: {'csv ', 'zipped file '}  

###Execution-Environment:  
  
  Cloudify-version: 3.2  
  Docker-version: 1.8+  
  OS-type: ubuntu14.04  
  Disk-space: 10 GB  
  RAM: 3 GB  
  
#Deployment Instruction  
This repository includes all files and scripts to deploy Col-invert workflow on Multiple Docker containers as follow:  
  
1- Clone the repository to your machine, open a terminal window and change to workflow repository.  
2- To execute the workflow with multi containers and the attached input sample, in the terminal run:   
   . ./Colinvert-deploy.sh 1    
3- If you have own input files, copy your files Dir to Picard/Input-sample folder, open Input.yaml file and change input Dir name, then  
   run: . ./Colinvert-deploy.sh 1  
  
4- To execute the workflow with single container, follow either step 2 or 3 but run:    
   . ./Colinvert-deploy 2  
  
After successfully running the workflow, five output files can be found in ~/blueprint-name folder
