* Create your Service Principal
  * Note down the application id
  * Generate a secret and note it down
  * Get your tenant id
* Enter the information into the variables at the top of the script
  * spuser="your-appid-from-your-service-principal"
  * sppwd="your-secret-for-your-service-principal"
  * tenant="your-tenant-id"
* Run the script
  * Copy the output of the script 
  
    ```export 'AZCOPY_OAUTH_TOKEN_INFO={"access_token":"eyJ0eXAiOi...","expires_in":"3600","expires_on":"1552650240","not_before":"1552646640","_token_refresh_source":"tokenstore"}'```
 * Execute the export command
 * Run AzCopy, and you'll notice it saying the OAuth token was used for authentication
  
```azcopy@TUX:~$ azcopy copy test.txt https://kvaestest.blob.core.windows.net/test/test.txt
Scanning...
AZCOPY_OAUTH_TOKEN_INFO is set.
Using OAuth token for authentication.

Job b01baaa1-7f2f-5444-72d7-08d2da675d64 has started

Log file is located at: /home/azcopy/.azcopy/b01baaa1-7f2f-5444-72d7-08d2da675d64.log

0 Done, 0 Failed, 1 Pending, 0 Skipped, 1 Total


Job b01baaa1-7f2f-5444-72d7-08d2da675d64 summary
Elapsed Time (Minutes): 0.0333
Total Number Of Transfers: 1
Number of Transfers Completed: 1
Number of Transfers Failed: 0
Number of Transfers Skipped: 0
TotalBytesTransferred: 19
Final Job Status: Completed```
