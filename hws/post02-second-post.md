Post 2 - Stat 133, Fall 2017
================

**Due date:** Thursday Nov-30, 2017 (before midnight)

The purpose of this assignment is to write a second blog post about one or more topics covered so far in the course.

A Reproducible Blog Post
------------------------

Compared to the first post, this time you will be required to write a blog post that can be **computationally reproduced** by a *competent* reader. What does this mean? It means that the reader (i.e. reviewer), following the content of your post, should be able to replicate all the results, graphics, or analysis, described in your post.

In order to make your blog post reproducible, any data set(s) that you use in your post should be publicly available. This implies that you may need to use data sets that already come in R, or data sets that are publicly available online, or create your own data set(s) as part of your post.

You should also list all the packages that the reader will require; if you decide to do some simulations involving random numbers, you must provide the random seed---e.g. `set.seed()`. Likewise, describe specific instructions to rerun and replicate your results, tables, graphics, etc., and disclose details about the version of the tools you are using (e.g. version of R, version of RStudio, version of packages).

Guidelines
----------

For this second post, use the same guidelines applicable to post 1:

-   You can talk about any of the things that we've covered so far in the course.
-   You could also choose a topic you are very interested in, but that hasn't been covered yet.
-   If the topic you chose for post 1 was too broad, you can also write a second part, expanding on what was presented in the first post.
-   Regardless of your chosen topic(s), you should write beyond the extent of what was covered in lecture/labs.
-   Write content using your own words.
-   Summarize keypoints, and comprehend the main concepts; expressing interpretations, descriptions, and conclusions from your own perspective.

Keep Mastery in mind ...
------------------------

The post assignments have an underlying goal of being *mastery oriented* tasks, as opposed to *performance oriented goals*. Here's a pdf by [Mark Girod](http://www.wou.edu/~girodm/vita.html) that compares both types of goals: **[Mastery vs Performance](../papers/mastery_vs_performance_goals.pdf)**

Take this assignment as an opportunity to:

-   learn more about something that has caught your attention.
-   know more about those things that you don't quite understand.
-   review and reflect on what you've learned so far.

------------------------------------------------------------------------

What to submit and where?
-------------------------

-   You must push the files of your post assignment to your `stat133-hws-fall17` github repository.

-   Create a folder `post02` and put everything there.

-   You have total freedom to determine the file structure of `post02`. But keep in mind that the `html` file will be the only file reviewed by one of your classmates.

-   Write your post using an `Rmd` file, and knit it in both `md` and `html` versions. Name the files: `post02-first-last.md` and `post02-first-last.html` with your own *first* and *last* names.

-   You will also have to submit your `html` file to bCourses, and to a Box folder **before the deadline (11/30)**.

-   Late submissions to Box will be penalized with a score of 0 (zero). No exceptions.

-   The reviewer will grade the version on Box that is the closest to the deadline (before the deadline). No exceptions.

-   Updating the version of your html file on Box **after the deadline** will also be penalized (-1 point for each update). Do NOT update your html file on Box after the deadline: it's not worth it (i.e. won't be reviewed), and you will only lose points.

------------------------------------------------------------------------

Specs
-----

Here's a list of general specifications:

-   **Introduction**: Write a clear and captivating introduction that grabs the reader's attention. And describe the purpose of the post.

-   **Organize the content**: Organize the content of your blog in different sections: e.g. motivation, background, examples, discussion, conclusions, and references.

-   **Images**: Include some images like pictures, diagrams, plots, drawings.

-   **Code**: Also include code snippets (e.g. code chunks) showing examples, clearly commented, nicely formatted.

-   **Take-home message**: Make sure to include a summarizing statement of the content in your post. If the reader had to remember one major thing from your post, what would that be?

-   **Length**: How long should your post be? There is not really a unique answer for this question. It depends on what you decide to write about. Try writing a post no shorter than 1,000 words, and preferably no longer than 5,000 words (these values are just a recommendation).

-   **Audience**: Think of your audience as other Stat 133 students, or students interested in data analysis but with (almost) no experience in this area. BTW: the instructor is NOT your audience.

-   **Style**: Write the content as a blogpost. In other words, this is NOT an academic paper. You can actually use some slang, and express ideas in the same way you would verbally explain things to a classmate.

-   **References**: You need to do more research, and include at least seven references. These could be data sets, posts, videos, books, articles, websites, etc.

-   **Be respectful**: Pretend that your post is public and thus could be read by ANYONE. So don't write things (or use language) you wouldn't like your future boss, or recruiters, to read about. Follow this rule of thumb: don't write things that you could later regret.

------------------------------------------------------------------------

Rubric
------

Here's the rubric to be used for grading the post. The reviewer is expected to enter scores for every graded aspect on a simple coarse scale (0, 0.5, and 1 points).

As a reviewer, please take some time to thoroughly read the posts you were assigned to review. This means that you may need to read a post at least twice. Read it first from begining to end, and then a second time in which you evaluate the aspects of the rubric.

As a reviewer, you should test all code examples to check whether you can obtain the same results displayed or described in the post.

Likewise, check any provided references in order to make sure that they are valid: e.g. a you tube video really exists, a website or post is active, a stackoverflow Q/A is legit.

Last but not least: please keep in mind the diversity of student backgrounds in Stat 133: students intending majoring in stats, applied math, computer science, biology, chemistry, economics, political sciences, environmental sciences, etc. It is possible that someone has decided to write about a topic that you are completely ignorant about. If that's the case, focus on the rubric aspects as objectively as possible.

<table>
<thead>
    <tr>
      <th align="left">Aspect</th>
      <th align="left">1 point</th>
      <th align="left">0.5 points</th>
      <th align="left">0 points</th>
    </tr>

</thead>
<tbody>
    <tr>
      <td><b>1) Title</b></td>
      <td>Title is clear and describes what the post is about.</td>
      <td>There is a title but it does not reflect what the post is about.</td>
      <td>There is an uninformative title, e.g.  "Post 02" or no title whatsoever.</td>  
    </tr>
    <tr>
      <td><b>2) Introduction</b></td>
      <td>The post begins with an introduction that describes the overall content and the motivation for the post.</td>
      <td>The introduction is vague.</td>
      <td>Very poor or nonsensical introduction.</td>  
    </tr>
    <tr>
      <td><b>3) Code Style</b></td>
      <td>Code is easy to read, well commented, names of objects are descriptive, preferably without lines exceeding 80-90 characters.</td>
      <td>Code is hard to read (e.g. no blank spaces), cryptic names of objects, contains almost no comments, some lines are too long and require horizontal scrolling.</td>
      <td>There is no code, or code is impossible to understand, there are no comments.</td>
    </tr>
    <tr>
      <td><b>4) Reproducibility</b></td>
      <td>All results (e.g. tables, graphs, outputs) are computationally reproducible</td>
      <td>Between one and three results are impossile to reproduce</td>
      <td>More than half of the results are irreproducible</td> 
    </tr>
    <tr>
      <td><b>5) Spelling</b></td>
      <td>There are basically no typos or spelling errors.</td>
      <td>Several typos and/or errors, but they don't interfere with the reading.</td>
      <td>The typos and/or errors make the post difficult to read (e.g. reader has to spend some time deciphering the meaning of a sentence).</td>
    </tr>
    <tr>
      <td><b>6) References</b></td>
      <td>There are at least 7 references, all valid.</td>
      <td>There are at least 7 references, but one or two of them are suspicious or invalid; e.g. a link does not work, a video does not exist.</td>
      <td>There are less than 7 references, or three or more references are suspicious or invalid; e.g. a link does not work, a video does not exist.</td>
    </tr>
    <tr>
      <td><b>7) Organization</b></td>
      <td>Content is well organized, with identifiable sections and subsections, logical structure, it flows adequately.</td>
      <td>Content is somewhat organized, but some parts lack structure.</td>
      <td>Content poorly organized, lacking overall structure. Gives the impression that it was written "one hour before the deadline".</td>
    </tr>
    <tr>
      <td><b>8) Originality</b></td>
      <td>The post presents material beyond what was covered in lecture, lab, slides, and tutorials. There is added value to it.</td>
      <td>The post is an elaborated remix of already covered material, but it considers new data set(s), adds personal opinions, reflections, and interesting examples.</td>
      <td>The post is a simplistic remix of what has been covered in lecture, lab, slides, and tutorials, without adding any new data, personal opinions and reflections.</td>
    </tr>
    <tr>
      <td><b>10) Message</b></td>
      <td>After reading the post, there is an (implicit or explicit) take home message.</td>
      <td>The post somewhat summarizes concepts but fails to condense them in one single idea.</td>
      <td>There is no (implicit or explicit) take home message.</td>
    </tr>

</tbody>
</table>
<h3>
Extra Comments
</h3>
In addition to the rubric, here's a list of 8 questions to be answered by the reviewer:

-   If you were not able to reproduce all the results (e.g. outputs, tables, graphs) of the post, why was that?

-   What things did you like about the post? Mention at least two of them.

-   What things could potentially be improved? Provide respectful constructive criticism.

-   Would you endorse reading the post on your social media apps (e.g. facebook, twitter, etc)?

-   Would you make the post part of the reading material for future editions of Stat 133?

-   Would you make (some of) the post part of a lab assignment for future editions of Stat 133?

-   Would you make (some of) the post part of a HW assignment for future editions of Stat 133?

-   Do you believe there is some suspicious of plagiarism? Do you think the post's author has not given proper credit? If yes, please describe.
