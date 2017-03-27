# Behavioral Observation of Students in Schools (BOSS) API

An API to store users, students, sessions, and observation intervals.
It allows users to CRUD on students, sessions and observations.

Link to the live application: [https://spw5235.github.io/behavioral-observation-of-students-in-schools](https://spw5235.github.io/behavioral-observation-of-students-in-schools)..

Link to the front-end repository: [https://github.com/spw5235/behavioral-observation-of-students-in-schools](https://github.com/spw5235/behavioral-observation-of-students-in-schools).

## ORM

The relationship of this api is one to many.  That is, one user can have many notes.  For a visualization of this relationship, view the following link: [https://drive.google.com/file/d/0B_Hv9u6cm8IVbWV2UW9uMU5HVHM/view?usp=sharing](https://drive.google.com/file/d/0B_Hv9u6cm8IVbWV2UW9uMU5HVHM/view?usp=sharing).

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
| GET    |            `/settings/:student_id/settings`                | `settings#index`      |
| GET    |                   `/settings/:id`                          | `settings#show`       |
| POST   |            `/students/:student_id/settings`                | `settings#create`     |
| PATCH  |                  `/settings/:id`                           | `settings#update`     |
| DELETE |                  `/settings/:id`                           | `settings#update`     |
| GET    | `/students/:student_id/settings/:settings_id/observations` | `observations#index`  |
| GET    |                `/observations/:id`                         | `observations#show`   |
| POST   | `/students/:student_id/settings/:setting_id/observations`  | `observations#index`  |
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
      "first_name": "Steve",
      "last_name": "Wisner",
      "born_on": "2000-01-01",
      "school": "School Name",
      "teacher": "Teacher Name",
      "grade": "4th"
    },
    {
      "id": 2,
      "first_name": "Jeff",
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
    "grade":"4th",
    "editable":true
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
     "grade":"z",
     "editable":true
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
      "grade":"4",
      "editable":true
    }
  }

 ```

 If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
  Request, and the response body will be empty or JSON describing the errors.
