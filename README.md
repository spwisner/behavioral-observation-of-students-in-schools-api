# Behavioral Observation of Students in Schools (BOSS) API

An API to store users, students, sessions, and observation intervals.
It allows users to CRUD on students, sessions and observations.

Link to the live application: [https://spwisner.github.io/behavioral-observation-of-students-in-schools](https://spwisner.github.io/behavioral-observation-of-students-in-schools).

Link to the front-end repository: [https://github.com/spwisner/behavioral-observation-of-students-in-schools](https://github.com/spwisner/behavioral-observation-of-students-in-schools).

Link to the heroku api: [https://behav-obs-of-students.herokuapp.com/](https://behav-obs-of-students.herokuapp.com/).

## ERD

The relationship of this api is one to many.  That is, one user can have many students, many sessions, and many observations.  For a visualization of this relationship, view the following:

![alt text](https://cloud.githubusercontent.com/assets/13546265/24553797/6aa48118-15f9-11e7-8647-911ac7f9e1b4.png "ERD")

## Dependencies

No additional dependencies were used for the api portion of this project.

## Technologies Used

The database was structured and scaffolded using Ruby on Rails.  JavaScript and jQuery were used to make ajax requests to the server to CRUD on a given table.

## General approach
The general approach of this project was to begin with a single table and to build onto it forming similar relationships.  By this, I am referring to the one to many relationships.  In this application, a user can have many student, each student can have many sessions, and each session can have many observations.  The exception to this rule is with the reports table.  Here, only one report can exist for each session.  By using the familiar one to many relationship, it was relatively straightforward to expand on what began as a basic project.

## Unsolve Problems
One unsolved problem is how to limit a user from submitting vast amounts of text into the reports table.  Although a user will need storage for this information, greater attention should be made to ensure that a user is offered some limitations.

## API end-points

| Verb   |                         URI Pattern                        | Controller#Action     |
|--------|------------------------------------------------------------|-----------------------|
| POST   |                       `/sign-up`                           | `users#signup`        |
| POST   |                      `/sign-in`                            | `users#signin`        |
| DELETE |                    `/sign-out/:id`                         | `users#signout`       |
| PATCH  |                `/change-password/:id`                      | `users#changepw`      |
| GET    |                     `/students`                            | `students#index`      |
| GET    |                   `/students/:id`                          | `students#show`       |
| POST   |                     `/students`                            | `students#create`     |
| PATCH  |                   `/students/:id`                          | `students#update`     |
| DELETE |                   `/students/:id`                          | `students#destroy`    |
| GET    |            `/sessions/:student_id/sessions`                | `sessions#index`      |
| GET    |                   `/sessions/:id`                          | `sessions#show`       |
| POST   |            `/students/:student_id/sessions`                | `sessions#create`     |
| PATCH  |                  `/sessions/:id`                           | `sessions#update`     |
| DELETE |                  `/sessions/:id`                           | `sessions#update`     |
| GET    | `/students/:student_id/sessions/:sessions_id/observations` | `observations#index`  |
| GET    |                `/observations/:id`                         | `observations#show`   |
| POST   | `/students/:student_id/sessions/:session_id/observations`  | `observations#index`  |
| PATCH  |                `/observations/:id`                         | `observations#update` |
| DELETE |                `/observations/:id`                         | `observations#destroy`|


All data returned from API actions is formatted as JSON.

---

## User actions

*Summary:*

### signup

The `create` action expects a *POST* of `credentials` identifying a new user to
 create, e.g. using `getFormFields`:

```html
<form>
  <input name="credentials[email]" type="text" value="an@example.email">
  <input name="credentials[password]" type="password" value="an example password">
  <input name="credentials[password_confirmation]" type="password" value="an example password">
</form>

```

or using `JSON`:

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password",
    "password_confirmation": "an example password"
  }
}
```

The `password_confirmation` field is optional.

If the request is successful, the response will have an HTTP Status of 201,
 Created, and the body will be JSON containing the `id` and `email` of the new
 user, e.g.:

```json
{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be empty.

### signin

The `signin` action expects a *POST* with `credentials` identifying a previously
 registered user, e.g.:

```html
<form>
  <input name="credentials[email]" type="text" value="an@example.email">
  <input name="credentials[password]" type="password" value="an example password">
</form>
```

or:

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password"
  }
}
```

If the request is successful, the response will have an HTTP Status of 200 OK,
 and the body will be JSON containing the user's `id`, `email`, and the `token`
 used to authenticate other requests, e.g.:

```json
{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "an example authentication token"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 401
 Unauthorized, and the response body will be empty.

### signout

The `signout` actions is a *DELETE* specifying the `id` of the user to sign out.

If the request is successful the response will have an HTTP status of 204 No
 Content.

If the request is unsuccessful, the response will have a status of 401
 Unauthorized.

### changepw

The `changepw` action expects a PATCH of `passwords` specifying the `old` and
 `new`.

If the request is successful the response will have an HTTP status of 204 No
 Content.

If the request is unsuccessful the reponse will have an HTTP status of 400 Bad
 Request.

---

The `sign-out` and `change-password` requests must include a valid HTTP header
 `Authorization: Token token=<token>` or they will be rejected with a status of
 401 Unauthorized.

## Student actions

All Student actions requests must include a valid HTTP header `Authorization: Token
 token=<token>` or they will be rejected with a status of 401 Unauthorized.

All students are associated with a user.

### index

The `index` action is a *GET* that retrieves all the students associated with a
 user.
The response body will contain JSON containing an array of students, e.g.:

```json
{
  "students": [
    {
      "id": 1,
      "first_name": "Eric",
      "last_name": "Chase",
      "born_on": "2000-01-01",
      "school": "School Name",
      "teacher": "Teacher Name",
      "grade": "4th"
    },
    {
      "id": 2,
      "first_name": "Bryan",
      "last_name": "Keogh",
      "born_on": "2001-02-02",
      "school": "School Name",
      "teacher": "Teacher Name",
      "grade": "3rd"
    }
  ]
}
```

If there are no students associated with the user, the response body will contain
 an empty students array, e.g.:

```json
{
  "students": [
  ]
}
```

Lastly, note that born_on, school, and teacher are optional values and values not assigned at creation will return a value of an empty string.

### create

The `create` action expects a *POST* with an empty body (e.g `''` or `'{}'` if
 JSON).
If the request is successful, the response will have an HTTP Status of 201
 Created, and the body will contain JSON of the created student. For example:

```json

{
  "student": {
    "id":2,
    "first_name":"Eric",
    "last_name":"Williams",
    "born_on":"2000-02-01",
    "school":"Brown School",
    "teacher":"Mr. Erickson",
    "grade":"4th"
  }
}

```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be JSON describing the errors.


 ### show

 The `show` action is a *GET* specifing the `id` of the student to retrieve.
 If the request is successful the status will be 200, OK, and the response body
  will contain JSON for the student requested, e.g.:

 ```json

 {
   "student": {
     "id":1,
     "first_name":"z",
     "last_name":"z",
     "born_on":"2016-01-01",
     "school":"z",
     "teacher":"z",
     "grade":"z"
   }
 }

 ```

 ### update

 This `update` action expects an empty (e.g `''` or `'{}'` if JSON) *PATCH* to
  update an existing student's information.

 If the request is successful, the response will have an HTTP Status of 200 OK,
  and the body will be JSON containing the student, e.g.:

 ```json

  {
    "student": {
      "id":2,
      "first_name":"Jeff",
      "last_name":"W",
      "born_on":"2016-02-01",
      "school":"QUINCY",
      "teacher":"G",
      "grade":"4"
    }
  }

 ```

 If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
  Request, and the response body will be empty or JSON describing the errors.


  ## Session Actions

  All Session actions requests must include a valid HTTP header `Authorization: Token
   token=<token>` or they will be rejected with a status of 401 Unauthorized.

  All sessions are associated with a student.  When making a request, obs_on and comment are optional.  By default, obs_on will take the current date.  If unspecified, comment will be submitted as an empty string.  Completed indicates whether or not all the observations in the session were made.  The completed value is determined on the back-end by comparing the int_num to the number of observations during a given session.

  ### index

  The `index` action is a *GET* that retrieves all the sessions associated with a user and student.  The response body will contain JSON containing an array of students, e.g.:

  ```json
  {
    "sessions": [
      {
        "id":1,
        "obs_on":"2017-03-30",
        "obs_session":"Outside",
        "obs_task":"Structured Play",
        "obs_time":15,
        "int_num":40,
        "user_id":1,
        "student_id":6,
        "comment":"",
        "completed":true
      },
      {
        "id":1,
        "obs_on":"2017-03-30",
        "obs_session":"Classroom",
        "obs_task":"Reading",
        "obs_time":10,
        "int_num":40,
        "user_id":1,
        "student_id":7,
        "comment":"",
        "completed":false
      }
    ]
  }
  ```

  If there are no sessions associated with the student, the response body will contain
   an empty sessions array, e.g.:

  ```json
  {
    "sessions": [
    ]
  }
  ```

  ### create

  The `create` action expects a *POST* with an empty body (e.g `''` or `'{}'` if
   JSON).
  If the request is successful, the response will have an HTTP Status of 201
   Created, and the body will contain JSON of the created session. For example:

  ```json

  {
    "obs_on":"2017-03-30",
    "obs_session":"Classroom",
    "obs_task":"Reading",
    "obs_time":10,
    "int_num":40,
    "comment":"",
    "completed":true
  }

  ```

  If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
   Request, and the response body will be JSON describing the errors.


   ### show

   The `show` action is a *GET* specifing the `id` of the session to retrieve.
   If the request is successful the status will be 200, OK, and the response body
    will contain JSON for the session requested, e.g.:

   ```json

   {
     "session": {
       "id":6,
       "obs_on":"2017-03-30",
       "obs_session":"Classroom",
       "obs_task":"Reading",
       "obs_time":10,
       "int_num":40,
       "user_id":1,
       "student_id":7,
       "comment":"",
       "completed":true
     }
   }

   ```

   ### update

   This `update` action expects an empty (e.g `''` or `'{}'` if JSON) *PATCH* to
    update an existing session's information.

   The interval number (int_num) and observation time (obs_time) are fixed at creation and cannot be updated.  This is to prevent the values to be altered after observations have been made.

   If the request is successful, the response will have an HTTP Status of 200 OK,
    and the body will be JSON containing the session, e.g.:

   ```json

    {
      "session": {
        "id": 2,
        "obs_on": "2016-02-01",
        "obs_session": "Classroom",
        "obs_task": "Reading",
        "obs_time": "15",
        "int_num": "30",
        "comment": "Session shortened due to time contraints",
        "editable":true
      }
    }

   ```

   If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
    Request, and the response body will be empty or JSON describing the errors.

  ## Observation Actions

    All observation actions requests must include a valid HTTP header `Authorization: Token
     token=<token>` or they will be rejected with a status of 401 Unauthorized.

    All observations are associated with a session.  There are mulitiple observations with each session.  When making a request, no values need to be included by a user.  Instead, default values are created for aet, pet, oft_m oft_v and oft_p (false). In addiiton, if unspecified, comment will be submitted as an empty string.

    Observation number (obs_num) is auto-generated to reflect the interval that an observation was made.  Because every fifth entry reflects a random peer, the obs_num also monitors who is being observed at a given moment.

  ### index

    The `index` action is a *GET* that retrieves all the observations associated with a session.  The response body will contain JSON containing an array of observations, e.g.:

    ```json
    {
      "observations": [
        {
          "id":3,
          "aet":true,
          "pet":false,
          "oft_m":false,
          "oft_v":false,
          "oft_p":false,
          "obs_comment":"",
          "obs_num": 1,
        },
        {
          "id":4,
          "aet":false,
          "pet":false,
          "oft_m":false,
          "oft_v":true,
          "oft_p":false,
          "obs_comment":"",
          "obs_num": 2,
        }
      ]
    }
    ```

    If there are no observations associated with the session, the response body will contain
     an empty observations array, e.g.:

    ```json
    {
      "observations": [
      ]
    }
    ```

  ### create

    The `create` action expects a *POST* with an empty body (e.g `''` or `'{}'` if
     JSON).
    If the request is successful, the response will have an HTTP Status of 201
     Created, and the body will contain JSON of the created observation. For example:

    ```json

    {
      "id":5,
      "aet":false,
      "pet":true,
      "oft_m":false,
      "oft_v":false,
      "oft_p":false,
      "obs_comment":"",
      "obs_num": 3,
    }

    ```

    If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
     Request, and the response body will be JSON describing the errors.

  ### show

     The `show` action is a *GET* specifing the `id` of the observation to retrieve.
     If the request is successful the status will be 200, OK, and the response body
      will contain JSON for the observation requested, e.g.:

     ```json

     {
       "observation": {
         "id":5,
         "aet":false,
         "pet":true,
         "oft_m":false,
         "oft_v":false,
         "oft_p":false,
         "obs_comment":"",
         "obs_num": 3,
       }
     }

     ```

  ### update

     This `update` action expects an empty (e.g `''` or `'{}'` if JSON) *PATCH* to
      update an existing observation's information.

     If the request is successful, the response will have an HTTP Status of 200 OK,
      and the body will be JSON containing the observation, e.g.:

     ```json

      {
        "observation": {
          "id":5,
          "aet":false,
          "pet":true,
          "oft_m":false,
          "oft_v":false,
          "oft_p":false,
          "obs_comment":"",
          "obs_num": 3,
        }
      }

     ```

     If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
      Request, and the response body will be empty or JSON describing the errors.
