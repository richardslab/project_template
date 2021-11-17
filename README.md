# project_template
A template for a project with CI and a docker image

# To use
After cloning this repo and using it as a template, you'll need to setup the two "secrets" (username and access token) for docker so that it will be able to push newly created docker images up to dockerhub for you.

To do this: 
1. go to hub.docker.com and log-in with the user you'd like to use for this purpose. 
2. click on your login at the top right corner and select "Account Settings"
3. Select "Security" and click on "New Access Token"
4. Give your token a descriton (something like, "An access token for the CI at the new-and-amazing-tool's repository")
5. Choose "Read & Write" as permissions
6. Click "Generate" 

7. WAIT, do not click "copy and close" yet!!!!

8. First, in a separate tab, go to github, to the repository you are setting up and go to "settings" => "secrets" and click "New repository secret"
9. Add a "DOCKERHUB_USERNAME" token with your dockerhub username
10. Add a "DOCKERHUB_TOKEN" token and for the value of the token switch back to the dockerhub tab, click "copy and close" and switch back to the github tab and paste the value.
11. Make sure that you see that there are two secrets as named above (you will not be able to verify their values...they are secret!)
12. If you need to, you can invalidate the token and put a new one in. Tokens are best used for one purpose each.

