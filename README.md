# MoodWiz

## Team Members
1. Sidhya Jain
2. Ananya Pawar
3. Chaitravi Chalke
4. Asavari Ambavane
5. Shreyas Wasnik
6. Pratam Jain
7. Surabhi Chandane

## Team Mentors
1. Shivani Pawar
2. Bhavya Sheth

## Tech Stack
### *Frontend*
* Flutter 

### *Backend*
* Python 
* Flask
* Firebase firestore

## Project Description
MoodWiz is an Android app which recommends a playlist of songs according to the user's current mood. The very first page of the app is Login/Sighup page. Users can signup using their email id. The authentication is done with the help of firebase and then the user email is added to a database in cloud firestore. After the login page come sthe home page, where the user can either search songs manually or opt for song recommendation based on their current mood by clicking on the camera icon at the bottom right of the screen. The user's mood is detected using a photo captured by the user through the provided camera. We have used knowledge of Convolutional Neural Networks and Tensorflow for facial emotion recognition. The menu bar at the top left of the homepage screen takes you to the settings page. Buttons for accesing favourite songs, editing profile, checking app verion, app info, logging out are available on this page. Several python libraries, framweworks have been used in the development of this project which are as follows:

### *Keras:*
Keras is a python-based framework used for debugging in python. It was used in the devlopment and evaluation of the deep learning modles created for mood recognition.

### *OpenCV:*
OpenCV is a python library majorly used for computer vision amd machine learning. In this project, we have used OpenCV for processing the images captured by the user. OpenCV,'s object detection algorithm - *Haar Cascades* is used for detecting facial features.

### *Numpy:*
Numpy is a python library used to work with muti-dimensional arrays and matrices. OpenCV makes use of numpy to perfrom all the operations. All the OpenCV arrays structures are converted to and from Numpy arrays.

### *Flask:*
Flask is a micro-framework written in python.It is used to dynamically build HTML pages using Python concepts. 

