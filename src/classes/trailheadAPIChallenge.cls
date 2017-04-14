/**
 * Copyright (c) 2012, Salesforce.com, Inc.  All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 * 
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 * 
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 * 
 *   * Neither the name of Salesforce.com nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
public class trailheadAPIChallenge {
    
    public static void getTrail(){
            
            // create a new HttpRequest object
            HttpRequest req = new HttpRequest();
            
            // get the current user's sessionId to use later as an access token for the Trailhead API Authorization
            string sid = UserInfo.getSessionId();
            //System.debug('session information ' + sid);
            
            // extend timeout to 20 seconds for slow responses
            req.setTimeout(20000);
            
            // create new response object for collecting the callout results
            HttpResponse res = new HttpResponse();
            Http http = new Http();
            
            // fill in the necessary settings for calling out to the Trailhead API:
            req.setEndpoint('https://api.trailhead.salesforce.com/search/trails');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/json; charset=utf-8');
            req.setHeader('X-API-Key', 'FILL_ME_IN');
            //req.setBody('{"FILL_ME_IN":["FILL_ME_IN"],"FILL_ME_IN":"FILL_ME_IN"}');
            req.setHeader('Authorization', 'Bearer '+ sid);

            // try to callout to the Trailhead API Rest API and if it doesn't work, catch the errors for debugging
            try {
                
                // send the http request and collect it in a response
                res = http.send(req);
                
                // serialize the resulting String into a map of name-value pairs (String-Object)
                Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody()); 
                
                // get the total_count from the map
                Integer totalCount = (Integer)jsonMap.get('total_count');               
                
                // makes sure these are true
                System.assert(totalCount > 0);
                System.assertEquals(200, res.getStatusCode());

                // output to the logs in case you want to view the results
                System.debug('request: '+ req.toString());
                System.debug('response: '+ res.toString());
            
            } catch(System.CalloutException e) {
                System.debug('Callout error: '+ e);
                System.debug(res.toString());
            }
        }
    }