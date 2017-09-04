Lab 3: Github repo for Stat 133
================
Gaston Sanchez

> ### Learning Objectives
>
> -   Clone a repository and add your own remote repo
> -   Practice adding, committing, and pushing to a remote repo
> -   Upload your own material to your assignments repository

------------------------------------------------------------------------

Directory for Stat 133
----------------------

The first thing you'll have to do is to create a directory for the course. I recommend using the name `stat133` but you can choose a different title. The location of this directory is entirely up to you (e.g. your home directory, your Desktop, or your Dropbox folder, for instance).

-   Open the terminal (bash or gitbash)
-   Optional: change directory to your preferred location
-   Create a directory for Stat 133

    ``` bash
    mkdir stat133
    ```

-   Change directory to `stat133`

    ``` bash
    cd stat133
    ```

Cloning the Assignments Repository
----------------------------------

Once you created a directory for Stat 133, the next step involves cloning (i.e. copying) the `stat133-hws-fall17` repository from GitHub. First, make sure you are inside `stat133` (or the name that you chose); you can check your working directory with `pwd`

    pwd

Assuming that you are inside the directory `stat133`, now you can clone `stat133-hws-fall17` with the following git command:

``` bash
git clone https://github.com/ucb-stat133/stat133-hws-fall17.git
```

The previous command will download and create your own copy of the template repository. This is the repository that you will be using to upload ALL your assignments: warm-up assignments, HW assignments, and posts.

*Note*: If you have followed the previous instructions, you should be fine. But just in case, here's a brief important notice. Please, do NOT fork the repository `stat133-hws-fall17`. Forking and Cloning are two different things.

Customizing the `README.md` file
--------------------------------

Now that you have your own repository `stat133-hws-fall17`, you need to customize some of the contents of the `README.md` file.

-   Change directory to your assignments repo:

    ``` bash
    cd stat133-hws-fall17
    ```

-   List the contents

    ``` bash
    ls
    ```

-   You should be able to see a file `README.md`
-   Open `README.md` with your favorite text editor (e.g. you can open it from RStudio if you are not sure what text editor to use).
-   At the very top of the `README.md` you will find the following four fields:

<!-- -->

    - Student name: First Last
    - Github username: usrname
    - Lab section: 101
    - GSI: Leia Organa

-   Change the default content with your own information:
    -   your first and last names
    -   your github username
    -   your lab section
    -   the name of your section's GSI
-   Save the changes

Adding a remote repository
--------------------------

-   Right now you have a (local) git repository in your computer. But you don't have a remote repository in GitHub.
-   In order to have a repo in github, you need to first add a remote. Use the command below **with your own username**:

    ``` bash
    git remote add origin https://github.com/username/stat133-hws-fall17.git
    ```

-   Verify your new remote

    ``` bash
    git remote -v
    ```

-   If everything is OK, you should be able to see a message (with your own username) like this:

        # Verify new remote
        origin  https://github.com/username/stat133-hws-fall17.git (fetch)
        origin  https://github.com/username/stat133-hws-fall17.git (push)

-   Go to your Github repository and check that you have a repo `stat133-hws-fall17.git` (it will be empty, but don't worry).

Pushing `README.md` to GitHub
-----------------------------

-   So far you should have a local repository (in your computer), and an empty remote repository (in your github).
-   Let's add the changes in `README.md` file

    ``` bash
    git add README.md
    ```

-   As it is customary, after adding changes, you check the status of your repository (You should see a git message telling you about the *"Changes to be committed"*):

        git status

-   Now let's commit those changes, including a commit message:

        git commit -m "readme: customize with personal information"

-   Now let's push your commit to the remote branch (`origin`) from the local branch (`master`):

    ``` bash
    git push origin master
    ```

-   Go to your Github repository and refresh the browser. If everything went fine, you should be able to see the contents of the `README.md` file.

Pushing Warm-Up 01 assignment
-----------------------------

-   As you can tell, you have a folder (i.e. directory) `warmup01` in your local repo. This folder contains its own `README.md` file.
-   Somewhere in your computer you should have the `.Rmd` file of your first warm-up assignment: it should be named `up01-first-last.Rmd` where `first` and `last` are your first and last names.
-   Copy your `up01-first-last.Rmd` file to the directory `warmup01`.
-   Open `up01-first-last.Rmd` (e.g. open it with RStudio).
-   In the yaml header of `up01-first-last.Rmd`, change the **output** field from `html_document` to `github_document`.
-   Knit the file; the output file should be a markdown file with `.md` extension (e.g. `up01-first-last.md`).
-   In the terminal, make sure you are inside the directory `warmup01`.
-   Let's add and commit all the files in `warmup01`: the `README.md` file, the source `.Rmd` file, and the knitted `.md` file; remember to use your *first* and *last* names:

        git add README.md up01-first-last.Rmd up01-first-last.md
        git commit -m "warmup01: generate github document"

-   Now, let's push the committed changes to the remote repo in github:

    ``` bash
    git push origin master
    ```

-   Go to your github repo, and check the contents of the folder `warmup01`, you should be able to see the `.Rmd` and `.md` files.
-   Take a look at the `.md` file, it should be rendered nicely by github.

Pushing Warm-Up 02 assignment
-----------------------------

-   Follow the previous instructions to push your second warm-up assignment to Github.
-   Copy `up02-first-last.Rmd` to the directory `warmup02`
-   Open `up02-first-last.Rmd` and change the yaml **output** field as: `github_document`
-   Knit the file to get an `.md` document
-   Make sure you are inside the directory `warmup02`.
-   Add and commit the`README.md` file, the source `.Rmd`, and the `.md` file; remember to use your *first* and *last* names:

    ``` bash
    git add README.md up02-first-last.Rmd up02-first-last.md
    git commit -m "warmup02: generate github document"
    ```

-   Push the committed changes to your remote repo:

    ``` bash
    git push origin master
    ```

-   Go to your github repo, and check the contents of the folder `warmup02`, you should be able to see the `.Rmd` and `.md` files.
-   Take a look at the `.md` file, it should be rendered nicely by github.

Make your repository private
----------------------------

-   Right now your `stat133-hws-fall17` repository is public, and everybody can see its contents.
-   To reduce the temptation of students taking a peek at other classmates repositories, we are going to ask you to make your repo private.
-   Go to your github repository, and locate the **Settings** tab in the manu bar (at the top). Click on **Settings**.
-   Scroll down until you see the **Danger Zone**.
-   Select the option **Make this repository private**.
-   Go to **Settings** again, but now click on the **Collaborators & teams** (in the left sidebar).
-   You will have to add the instructor and your GSI as collaborators. Here's the list of staff usernames:
    -   Instructor: `gastonstat`
    -   Xiaoqi: `xz0416`
    -   Minchul: `mshin03`
    -   Omid: `osolari`
    -   Andy:
    -   Ningning:
-   Please keep your repository in private mode until the semester is over (Dec-18th).
-   I don't recommend deleting your repo after the semester is over. Why not? Because it is your work, and you will put many hours of effort on it. And I bet you will eventually come back to check its content to see how something was done (data reshaping, a plot, a function, slides, a shiny app, etc).
-   Keep your repo part of your (code) portfolio.
