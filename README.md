# project_template
A template for a project with CI and a docker image

# To use
After cloning this repo and using it as a template, you'll need to setup the two "secrets" (username and access token) for docker so that it will be able to push newly created docker images up to dockerhub for you. 

You'll also have to modify the dockerhub repository and image that the CI (continuous integration) will be pushing the newly minted images to. Currently it is setup to to go the "richardslab" repository and the "project_template" image. 

## Setting up your github secrets
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

## Setting up the dockerhub repo and image 
1. Open the file "setup.json" in the root directory of the newly minted (git) repo. It should look like this:

```json
{
   "dockerhub_repo": "richardslab",
   "dockerhub_image": "project_template",
   "conda_env": "analysis"
}


```
2. Edit the values (not keys) in this dictionary. make sure that there's a newline after the final `}` or you'll get strange errors. 
3. (optional) change the value of the "conda_env" from "analysis" to whatever you want. This value will be the name of the conda environment that will contain all your programs.
4. Save and file and commit it. 
5. Push your commits back to github and you should see in the "Actions" tab a few jobs starting up. Once they turn green you should be able to pull the docker image and use it!


## Using the docker image

