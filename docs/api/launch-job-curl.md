# How to run a job

In this example we are running the **Example Sum problem** which is a ver simple problem. The solvers for this problem must resolve the *sum of and b*.

So, in this case the input data is the numeric values for the two input paramters, **a** and **b**, and the list of solvers we want to run, just one solver in this example.

To run this request, you need the **`access_token`** obtained in the [login step](login-curl.md).

**cURL request**

```bash
curl -X POST https://api.qcentroid.xyz/problem/qcentroid-example-1-sum
   -H "Authorization: Bearer --THE ACCESS TOKEN--"
   -H "Content-Type: application/json"
   -d "{\"data\": {\"a\": 5, \"b\": 4}, \"solvers\": [{\"name\": \"qcentroid-example-sum\"}]}"
```

**Response**

The response will be the confirmation that a new **job** has been launched to execute the solver and the **job id**:

```json
{"detail":"Authorized", "job":"6ON49J7XU1SP"}
```

Now you can login to the web dashboard and when the job has finished, you will se the **obtained result**:

```json
{"sum": 9}
```


## What's next

:octicons-chevron-right-12: [See the job results in the web dashboard](../platform/see-job-results.md)

:octicons-chevron-right-12: [Use the API with Postman](using-postman.md)
