# Using the API with cURL


The first step you will need to use the QCentroid API is to login to the API with your **username** and **password** to obtain a valid `access_token`  for the following requests.

**cURL request**

```bash
curl -X POST https://api.qcentroid.xyz/login
   -H "Content-Type: application/json"
   -d "{\"username\": \"your-username\", \"password\": \"your-password\"}" 
```

**Response**

The response will be the access_token in a JSON payload:

```json
{"access_token":"--THE ACCESS TOKEN--"}
```

Now you can use this access token in your next requests uing the **Bearer authentication** scheme.



## What's next

:octicons-chevron-right-12: [Run a job](launch-job-curl.md)
