# MoodWiz

## Team Members
1. Sidhya Jain
2. Ananya Pawar
3. Chaitravi Chalke
4. Asavari Ambavane
5. Shreyash Wasnik
6. Pratam Jain
7. Surabhi Chandane

## Team Mentors
1. Shivani Pawar
2. Bhavya Sheth

## Tech Stack
#### *Frontend*
* Flutter 

#### *Backend*
* Python 
* Flask
* Firebase firestore

## Project Description
MoodWiz is an Android app which recommends a playlist of songs according to the user's current mood. First time any user opens the app, he/she will get to know the features of the app through 3 swipe screens. The very first page of the app is Login/Signup page. Users can signup using their email id. The authentication is done with the help of firebase and then the user email is added to a database in cloud firestore.  In case any user forgets password, the forget password button takes you to another screen to sign in using email and reset the password. After the login page comes the home page, where the user can either search songs manually or opt for song recommendation based on their current mood by clicking on the camera icon at the bottom right of the screen. Light theme-dark theme options are also provided on the homepage. The user's mood is detected using a photo captured by the user through the provided camera. We have used knowledge of Convolutional Neural Networks and Tensorflow for facial emotion recognition. The menu bar at the top left of the homepage screen takes you to the settings page. Buttons for accesing favourite songs, editing profile, checking app verion, app info, logging out are available on this page. Several python libraries, framweworks have been used in the development of this project which are as follows:

#### *Keras:*
Keras is a python-based framework used for debugging in python. It was used in the devlopment and evaluation of the deep learning modles created for mood recognition.

#### *OpenCV:*
OpenCV is a python library majorly used for computer vision amd machine learning. In this project, we have used OpenCV for processing the images captured by the user. OpenCV,'s object detection algorithm - *Haar Cascades* is used for detecting facial features.

#### *Numpy:*
Numpy is a python library used to work with muti-dimensional arrays and matrices. OpenCV makes use of numpy to perfrom all the operations. All the OpenCV arrays structures are converted to and from Numpy arrays.

#### *Flask:*
Flask is a micro-framework written in python.It is used to dynamically build HTML pages using Python concepts. 

## Future Scope

Till now we have made a decent frontend using Flutter and Dart for our app and we have also trained a mood recognition model using CNN and Tensorflow. Our future goals would be:
* To create a backend for fetching the image from the camera screen and feeding it to the model for mood recognition. We have already created an API to do so but we still have to work on it to make it fully functional.
* We are planning to use Spotify API to recommend and play songs in our app. So our goal would be to integrate the Spotify API with our ML model so that the API could recommend songs according to the mood detected by the model.

So as of now we have achieved PART 1 (mood recognition) of our project and are yet to do PART 2 (recommendation system).

# Screenshots
![swipescreen1](https://user-images.githubusercontent.com/80352794/119216890-07c3ef80-baf4-11eb-9046-5bd6aa956aaa.jpg)
![homepage_lt](https://user-images.githubusercontent.com/80352794/119216901-19a59280-baf4-11eb-9057-174f0524d30f.jpg)
![homepage_dt](https://user-images.githubusercontent.com/80352794/119216904-1b6f5600-baf4-11eb-82a7-22ef1d5124ee.jpg)
![swipescreen2](https://user-images.githubusercontent.com/80352794/119216905-1c07ec80-baf4-11eb-95c6-e986b26cf80d.jpg)
![loginpage](https://user-images.githubusercontent.com/80352794/119216907-1d391980-baf4-11eb-9129-ffd8bb60ad5b.jpg)
