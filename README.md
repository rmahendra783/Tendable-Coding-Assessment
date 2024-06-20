# Tendable Coding Assessment

## Usage

```sh
bundle
ruby questionnaire.rb
```

## Goal

The goal is to implement a survey where a user should be able to answer a series of Yes/No questions. After each run, a rating is calculated to let them know how they did. Another rating is also calculated to provide an overall score for all runs.

## Requirements

Possible question answers are: "Yes", "No", "Y", or "N" case insensitively to answer each question prompt.

The answers will need to be **persisted** so they can be used in calculations for subsequent runs >> it is proposed you use the pstore for this, already included in the Gemfile

After _each_ run the program should calculate and print a rating. The calculation for the rating is: `100 * number of yes answers / number of questions`.

The program should also print an average rating for all runs.

The questions can be found in questionnaire.rb

Ensure we can run your exercise

## Bonus Points

Updated readme with an explanation of your approach

Unit Tests

Code Comments

Dockerfile / Bash script if needed for us to run the exercise


..............................................................
Updated readme with an explanation of my approach


This Ruby program implements a survey where users can answer a series of Yes/No questions. The program calculates a rating based on the user's answers after each run and also provides an average rating for all runs. The answers are persisted using PStore to ensure they can be used in calculations for subsequent runs.

Usage
To run the questionnaire, use the following command:
bundle exec ruby questionnaire.rb


Requirements
The program meets the following requirements:

User Inputs:
The program prompts the user to answer a series of Yes/No questions.
Acceptable answers are "Yes", "No", "Y", or "N" (case insensitive).

Persistence:
Answers are persisted across runs using PStore.

Rating Calculation:
After each run, a rating is calculated as 100 * number of yes answers / number of questions.
An average rating for all runs is also calculated and displayed.


Example Output: You can check your Output on replit.com for easy way.


Questions-
The questions included in the survey are:

Can you code in Ruby?
Can you code in JavaScript?
Can you code in Swift?
Can you code in Java?
Can you code in C#?


Can you code in Ruby? (Yes/No): Yes
Can you code in JavaScript? (Yes/No): No
Can you code in Swift? (Yes/No): Y
Can you code in Java? (Yes/No): N
Can you code in C#? (Yes/No): Yes

Survey Report:
Can you code in Ruby? - Answer: Yes
Can you code in JavaScript? - Answer: No
Can you code in Swift? - Answer: Yes
Can you code in Java? - Answer: No
Can you code in C#? - Answer: Yes

Rating for this run: 60.0%
Average rating for all runs: 60.0%
