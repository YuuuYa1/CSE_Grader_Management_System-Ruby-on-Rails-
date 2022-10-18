# CSE Grader Management System (Ruby on Rails)

## Description

&nbsp;&nbsp;&nbsp;&nbsp;This program is designed to help the CSE department facilitate the grader finding process for the coming semester. Written in Ruby/Rails, the program uses the enclosed API to process the section and course information from the publicly accessible OSU course catalog. This program also supports login/logout functionality for Student, Instructor, and Admin users as well.


## Getting Started

### How to install
#### Step1: Install Ruby and Rails
1. Install rbenv as well as a useful rbenv plugin (ruby-build).<br />
```
$ git clone https://github.com/rbenv/rbenv.git ~/.rbenv 

$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc <br />

$ echo 'eval "$(rbenv init -)"' >> ~/.bashrc <br />

$ exec $SHELL <br />

$ git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build <br />
```

2. Install Ruby.<br />
```
$ sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
$ rbenv install 3.0.2
$ rbenv global 3.0.2  # set default ruby version
$ ruby -v # confirm it works
```

3. Install Rails.<br />
  (1)Rails requires a JavaScript runtime, which Ubuntu does not provide. Installing node.js solves this problem:<br />
  ```
  $ sudo apt-get install nodejs
  $ sudo npm install -g n
  $ sudo n stable
  ```
  (2)Install the Rails gem:<br />
  ```
  $ gem install --no-document rails -v 6.1.4
  ```
  Install yarn using your OS package manager, or take a look at https://yarnpkg.com/en/docs/install (Links to an external site.)
  Set it up<br />
  ```
  rails webpacker:install
  ```
  Make sure all packages are up to date<br />
  ```
  yarn install --check-files
  ```
4. Confirm Rails installation with a system test.<br />
```
 $ mkdir rails_work
 $ cd rails_work
 $ rails new demo
 $ cd demo
 $ rake about  # version info, checks for a javascript runtime, etc
 $ rails server

```
The output of the last command should look something like:<br />
```
 => Booting Puma
 => Rails 6.1.4 application starting in development
 => Run `rails server -h` for more startup options
 Puma starting in single mode...
 * Version 3.12.6 (ruby 2.7.4-p0), codename: Love Song
 * Min threads: 5, max threads: 5
 * Environment: development
 * Listening on tcp://0.0.0.0:3000
 Use Ctrl-C to stop
 ```
 You can kill the server with Ctrl-C (in the terminal window in which it is running):<br />
  ```
  ^C- Gracefully stopping, waiting for requests to finish
 === puma shutdown: yyyy-mm-dd hh:mm:ss -0500 ===
 - Goodbye!
 Exiting
  ```
#### Step2: Install Project
##### OPTION 1
1. Navigate to the main page of c4a1 repository.
2. Above the the list of files, click "Code"
3. To clone the repository using HTTPS, under "Clone with HTTPS", copy link . To clone the repository using an SSH key with a certificate issued by your organization, click Use SSH, then copy link. To clone a repository using GitHub CLI, click Use GitHub CLI, then copy link.
4. Open Git Bash.
5. Change the current working directory to the location where you want the cloned directory.
6. Type git clone, and then paste the URL you copied earlier.
```
$ git clone https://github.com/cse-3901-sharkey/c4a1.git
```
7. Press Enter to create your local clone.
8. In the terminal, navigate to the lab-2 folder within the c4a1 repository.
9. Then enter the following instructions
```
$ rails db:create
```
```
$ rails db:migrate
```
```
$ rails db:seed
```
```
$ rails s
```
10.Open the link in the yellow box
![install project](https://user-images.githubusercontent.com/98134192/160256880-16935c59-5bcd-464e-bdb3-39d9689de4dc.png)
11. You are all set. Welcome to the Grader system.

##### OPTION 2
1. Navigate to the main page of c4a1 repository.<br />
2. Above the the list of files, click "Code"<br />
3. Under Code, click "Download ZIP"<br />
4. Unzip the downloaded file <br />
5. Open the terminal and navigate to .../c4a1/lab-2<br />
6. Follow the instructions from step 9 onwards in option 1.<br />
7. You are all set. Welcome to the Grader system.<br />

##### Possible Problems
1. Ruby Version Conflict <br />
  (1). If you encounter any error related to the ruby version. You can follow the following steps
    ```
      $ vim .ruby-version
    ```
   (2). Enter "i" and change to the insert mode<br />
   (3). update your current code to "ruby-3.0.X" (matching with the version that has installed)<br />
   ![version](https://user-images.githubusercontent.com/98134192/160258060-dbd4402f-22ba-41d9-aa9c-3fd959461866.png)<br />
   (4). Press "esc" and enter ":wq" to save the update<br />
   ![save](https://user-images.githubusercontent.com/98134192/160258065-3a8cb77a-8613-4cf2-b74c-7e9f399af43f.png) <br />
   (5). You are all set. If you still get error, you can enter "bundle install" in the terminal.<br />
   (6) Then you can follow the instruction 9 in option 1 to run the project.<br />
   
   
   
### Roles in the grader system 
   * ADMIN <br />
     1. See all courses/sections detailed description by clicking on the table slot<br />
     2. Rank/sort information based on variable names in the table <br />
     3. Create update or delete courses or sections info <br />
     4. Access and update user info (including assigning admin privilege)<br />
     5. reload course and section info based on the term and campus

   * Instructor<br />
     1. See all courses/sections detailed description by clicking on the table slot<br />
     2. Search Course information based on the course name
     3. submit recommendation and evaluation
     4. Rank/sort information based on variable names in the table <br />
     
   * Student<br />
     1. submit application
     2. See all courses/sections detailed description by clicking on the table slot<br />
     3. Rank/sort information based on variable names in the table <br />
     4. Search Course information based on the course name
    

### How to use the grader system
#### Main Page
  After you finished instructions 9 and 10 in "install project" option 1. You can see the main page of the grader system. <br />
  In the main page, you can sign up if you are new user. Sign in if you already have an account.<br />
    ![mainpage1](https://user-images.githubusercontent.com/98134192/160321914-a538ce49-44fa-408c-a94a-cfe9ac1c7764.png)
#### Sign up page
Users must use their osu email to sign up for the grader system (Format: LastName.Number@osu.edu). It is up to the user to make sure they input the right email as it determines the role (student or instructor). Note: Turbo from Rails 7 prevented the error messages from showing on the sign up page for validations.
![signup1](https://user-images.githubusercontent.com/98134192/160322381-c6285041-32eb-4dd3-8ccb-fd283d7bb5b5.png)

#### Sign in page
After users have their accounts, they can sign in in the following page.<br />
Admin Account Information: Email=admin@osu.edu Password=password <br />
Note: To sign into another account after logging out, user must access main page again by editing the url.
![sign in](https://user-images.githubusercontent.com/98134192/160322757-3714013d-f700-4371-9284-68a7f84b8e07.png)

#### Course Page
If the tables are blank, only admin has the permission to load/reload course and section information into the tables.<br />
If user is an admin, navigate to the users tab on the left and click on any user. In the new window, there is a reload button that can be used to load course and section information.<br />
After the admin clicks the reload button, the admin can see a page where the admin can choose which semester and campus they want to reload. After selecting the term and campus, the admin can click reload button and go to  course button. Then, the admin will be back to the course page and see the loaded course information.<br />
![term and campus](https://user-images.githubusercontent.com/98134192/165419180-084db371-2dba-4192-b13b-160d6ac12852.png)

Then you can see the loaded table below. Users can also use the search bar on the upper left to search courses based on courses' name <br />
 ![search](https://user-images.githubusercontent.com/98134192/165428441-b8483d33-ecd8-4019-a0b5-b7ff2cf758ac.png)

Admins have additional access to the user page.
![bar](https://user-images.githubusercontent.com/98134192/165431027-c9a4d8fc-4e6c-4acd-a5a1-f9930771fa50.png)


 #### Editing Course Page
 Admin has the acess to update and delete course info<br />
 ![edit course](https://user-images.githubusercontent.com/98134192/160260907-598d1506-3f06-4683-bcc5-16306ca1439b.png)

#### Editing User Page
Admin has the acess to update and delete User info<br />
Admin can also assign regular users to be admin<br />
![edit user ](https://user-images.githubusercontent.com/98134192/160323653-6a7f93ef-3abb-4fc2-8e64-478704d96e00.png)
#### Application Page
On the application page, students can finish the application by writing down personal info, course info, and availability<br />
![application](https://user-images.githubusercontent.com/98134192/165679886-615e98cd-78a4-4d9f-a1b3-b756487f9b49.png)

#### Evaluation Page
Both Admins and instructors have access to the Evaluation Page. On the page, they can submit the Evalution for student. Instructors and admins can rate student's performance using the droplist.They also can delete or make changes on the existing evaluation.<br />
![new Evaluation](https://user-images.githubusercontent.com/98134192/165679299-72857caa-e86c-4a75-a8f7-a7f519182ef2.png)


#### Recommendation Page
On the recommendation page, both admins and teachers can submit recommendations for students. They need to fill in the "Course Number," "Instructor ID," "Student ID," and "Reason" boxes.  If admins or teachers leave blank in any boxes mentioned above, they will get a warning "Please correct the errors below." They also can give a strong recommendation by clicking the "highly Recommend" box.<br />
![recommendation](https://user-images.githubusercontent.com/98134192/165422215-955d42a2-ed19-4330-94b7-b2c6d8fa2a90.png)

## Code Layout
In this lab, Our group mainly modified codes in the "app" folder,which are listed as follows<br />
&nbsp;&nbsp;**1.Admin**<br />
&nbsp;&nbsp;&nbsp;&nbsp;*courses_admin.rb <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; contains functions that relate to the user access and course table info <br />
&nbsp;&nbsp;&nbsp;&nbsp;*sections_admin.rb <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; contains functions that relate to the user access and section table info <br />
&nbsp;&nbsp;**2.Controllers** <br />
&nbsp;&nbsp;&nbsp;&nbsp;*application_controller.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; generate automatically by rails<br />
&nbsp;&nbsp;&nbsp;&nbsp;*courses_controller.rb <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; contains code about action load to fetch courses and sectiones' info from the OSU API<br />
&nbsp;&nbsp;&nbsp;&nbsp;*home_controller.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; contains code about action index that directs to the home page<br />
&nbsp;&nbsp;&nbsp;&nbsp;*users_controller.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; contains code about action new and create that are used to generate a new user, and defines the accessible parameters<br />
&nbsp;&nbsp;**3.Models**<br />
&nbsp;&nbsp;&nbsp;&nbsp;*application_record.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; automatically generated by rails<br />
&nbsp;&nbsp;&nbsp;&nbsp;*course.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; contains functions that fatch data from school API and sort required variables for both courses and sections <br />
&nbsp;&nbsp;&nbsp;&nbsp;*section.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all sections' fetching has been integrated in course.rb <br />
&nbsp;&nbsp;&nbsp;&nbsp;*user.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; contains functions that synchronize user information with their osu account information <br />
&nbsp;&nbsp;**4.View**<br />
&nbsp;&nbsp;&nbsp;(1)Courses<br />
&nbsp;&nbsp;&nbsp;&nbsp;*load.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;contains codes that demonstrate how the webpage structured when the data are reloaded successfully<br />
&nbsp;&nbsp;&nbsp;(2)Homes<br />
&nbsp;&nbsp;&nbsp;&nbsp;*index.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;contains codes that demonstrate how home page structured<br />
&nbsp;&nbsp;&nbsp;(3)layouts (Generate automatically by rails)<br />
&nbsp;&nbsp;&nbsp;&nbsp;*application.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;*mailer.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;*mailer.text.erb<br />
&nbsp;&nbsp;&nbsp;(4)users<br />
&nbsp;&nbsp;&nbsp;&nbsp;*new.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;contains codes that demonstrate how the sign up page structured<br />
&nbsp;&nbsp;**5.Config**<br />
&nbsp;&nbsp;&nbsp;&nbsp;*routes.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;contains codes that connect webpages and actions<br />
  

## Team Members

Contributors names
  - Allen Chen
  - Yu Huo
  - Wenhan Zhou
  - Dailin Li
  - Yunqing Qiu
