//
//  FAQs.m
//  Due Dates
//
//  Created by Zack Spicer on 7/30/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "FAQs.h"

static NSString const *FAQSectionKey = @"questionSectionKey";
static NSString const *FAQQuestionsKey = @"questionsKey";
static NSString const *FAQQuestionTitleKey = @"questionTitleKey";
static NSString const *FAQAnswerKey = @"answerKey";

@implementation FAQs

+ (NSInteger)count {
    return [[self FAQsArray] count];
}

+ (NSString *)typeAtIndex:(NSInteger)index {
    return [self FAQsArray][index][FAQSectionKey];
}

+ (NSString *)questionTypeAtIndex:(NSInteger)ingIndex inQuestionAtIndex:(NSInteger)recIndex {
    return [self FAQsArray][ingIndex][FAQQuestionsKey][recIndex][FAQQuestionTitleKey];
}

+ (NSString *)questionTypeAtIndex:(NSInteger)ingIndex withAnswerAtIndex:(NSInteger)recIndex
{
    return [self FAQsArray][ingIndex][FAQQuestionsKey][recIndex][FAQAnswerKey];
}

+ (NSInteger)questionsCountAtIndex:(NSInteger)index {
    return [[self FAQsArray][index][FAQQuestionsKey] count];
}

+ (NSArray *)FAQsArray
{
    return @[
             @{
                 FAQSectionKey : @"General",
                 FAQQuestionsKey : @[
                         @{FAQQuestionTitleKey : @"What is this app supposed to do?",
                           FAQAnswerKey : @"\tThis app was designed to organize your work load. It takes every individual task that needs to be done with a date and time it should be done, and the app calculates the amount of work that should be done each day,hour,week, or month in order to complete each task by it's due date. \n\n\tAll you have to do is enter the information for each task, and the app will do the rest. Whether you want your work to divided hourly, daily, weekly, or monthly, this app will do it. You don't have to worry about figuring out what task or how much work needs to be done each day, because all the work that needs to be done for that day will be analyzed, calculated, and displayed to you. \n\n\tWhy is this different than planner? A planner will tell you what is due when, but it will not distribute, divide, and tell you how much work needs to done hourly, daily, weekly, or monthly to complete every task. You can wake up each morning and know exactly what needs to be done, and once your done your regular schedule of task, you can go on with your day knowing every task will be completed by their due dates."},
                         @{FAQQuestionTitleKey : @"What am I supposed to do on the \"Create New Entry\" page?",
                           FAQAnswerKey : @"\tThis page is accessed by the \"Create A New Entry\" button on the main page. This page is used to create a new task that you want to be done. On this page, you need to provide a name, date, time, work divide, and type. The work divide is how you want your work to be divided for that specific task, whether it's hourly, daily,weekly, or monthly(To learn more about work divide check out the Terms and Definitions section in the FAQ's).\n\n\tIt is suggested that the time entered be 12:00am so that the work is done exactly by that day unless you want the hours to be specific or your going to divide the work hourly. It's also advised that you set the due date for the day before, because the app will calculate the amount of work for that exact date. For example, if you have a project due on June 3rd that needs to be presented, you may want to finish it the day before and not finish it as your walking into work or school. \n\n\tLastly, you put in the type which is used to help specify the task that you need done. You can choose from various types such as homework, project, test, chores, etc (To learn more about type check out the Types section in the FAQ's)."},
                         @{FAQQuestionTitleKey : @"What does the \"View Current Entries\" page show?",
                           FAQAnswerKey : @"\tThis page is accessed by the \"View Current Due Dates\" button on the main page. This page is used to view all the current entries in place. At the top of the page it shows the statistics of your entries for a quick briefing of the entire entry list. This page will show the basic information such as name, due data, time, etc. and task to be done for that period(for an explanation of period, go to \"Terms and Definitions\" of the FAQ) for each entry. At the top of the view page, statistics of all the entries are shown. The number of entries, the number of entries due in 24 hours, the number of entries already due, the entry due next, the number of entries with incomplete task, and the number of entries for each type are shown in the statistics section. \n\n\tEvery type has a drop down menu that will expand when clicked on. Each task for a single entry has a checkbox next to it that can be checked when completed and unchecked if needed.If checked, the portion of work specified will be counted as completed, and will be recorded by the app. The task for each entry updates after every hour,day ,week, or month depending on the work divide of the entry. \n\n\tWith each entry, two buttons are available. One being the full info button, taking you to the full info screen for that specific entry, and the other being the delete button in case you want to delete an entry."},
                         @{FAQQuestionTitleKey : @"What does the Full info page show?",
                           FAQAnswerKey : @"\tThe full info page is a page used to show all aspects of a single entry. The page can be reached through the View Current Entries page. At the top of the page is the name of the entry.Following that, is the basic information including the due date, due time, work divide, and type. After that is a section labeled \"Period's Work\" which shows the work that needs to be done currently for that period(For a better understanding of the work period, please go to the Terms and Definitions section of the FAQ). \n\n\tThe ending two sections \"Work to be done\" and \"Work Already Done\" shows a combination of all the task and how much work is done versus how much work isn't done. \n\n\tAt the bottom of this page are three buttons(Last one being the back button). The first button \"Change work done\" enables you to change the work already done, while the second \"Edit Information\" allows you to edit the basic and special information. Be cautious when using these two buttons, as they will affect your work load per period."},
                         @{FAQQuestionTitleKey : @"Why does my entry highlight green on the view entries page?",
                           FAQAnswerKey : @"\tWhen an entry is highlighted green, it means you have 24 hours before the entry is due. This acts as a warning to let you know that you need to start wrapping up any work left."},
                         @{FAQQuestionTitleKey : @"Why does my entry highlight red on the view entries page?",
                           FAQAnswerKey : @"\tWhen an entry is highlighted red, it means the due date for that entry has been reached and passed. The entry will then be deleted within 24 hours, so if you wanted an extension on the entry you have 24 hours to change the due date. Otherwise, the entry will be deleted in 24 hours and can not be received afterwards. If you don't want your entries to be deleted automatically, or you want them to be deleted after a different amount of time, go to the settings option on the main screen."},
                         ],
                 },
             @{
                 FAQSectionKey : @"Types",
                 FAQQuestionsKey : @[
                         @{FAQQuestionTitleKey : @"What is the \"type\" for each entry?",
                           FAQAnswerKey : @"\tThe \"type\" is a specification to help you organize your work in a more fitting fashion for each entry. You can choose from homework, essay/paper, project, test, chores, practice/exercise, and other. Each has its own unique set-up that will help divide your work in a better fashion. For example, if your working on a project, you may want to focus on certain sections of a project more than other sections and work on them in order, while homework is a list of questions that need to completed regardless of order."},
                         @{FAQQuestionTitleKey : @"How does the homework entries Work?",
                           FAQAnswerKey : @"\tThe homework entries are the simplest of all entries. When creating a new homework entry, or editing an old one, you will be asked to enter in the number of questions. When the app divides the work for this type, the questions will be chosen in a random order, and will be asked to be done is percentages. You may be asked to do 50% of question 1 and 33% of question 20 for one day, and then asked to do 40% of question 6 on another."},
                         @{FAQQuestionTitleKey : @"How does the Essay/Paper entries work?",
                           FAQAnswerKey : @"\tThe essay/paper entries can be handled in one of two different ways. They can either be divide by a certain number of words,paragraphs, or pages, or be divided based on a list of requirements that need to be completed for the essay/paper. When creating a new entry or editing an old one, you will have to choose between four options. \n\n\tThe first three(words, paragraphs, and pages) are a count that requires a number, while the last one is a list similar to project and test. Only one option can be chosen."},
                         @{FAQQuestionTitleKey : @"How does the Project entries work?",
                           FAQAnswerKey : @"\tProject is a type used to specify project checkpoints for completion. When creating a new entry or editing an old one, you will have to make a list of project requirements. This list can also be prioritized if needed. If you wanted to enter in many checkpoints in the project, but didn't want to do it by hand, simply type in '*' followed by a number(WARNING: any other character following the '*' including spaces will not work) into the list of To Do when making or editing the entry."},
                         @{FAQQuestionTitleKey : @"How does the Test entries work?",
                           FAQAnswerKey : @"Test is a type used to help you study for an exam or test. When creating a new entry or editing an old one, you will have to make a list of chapters or sections you need to study. This list can also be prioritized if needed. If you wanted to enter in many chapters, but didn't want to do it by hand, simply type in '*' followed by a number(WARNING: any other character following the '*' including spaces will not work) into the list of chapters/sections when making or editing the entry."},
                         @{FAQQuestionTitleKey : @"How does the Chores entries work?",
                           FAQAnswerKey : @"\tThe chores type is used to help you divide a list of chores. When creating a new entry or editing an old one, you will be prompted to add the names of chores with their expected time to be completed in minutes. This is the only list that is automatically prioritized based on the expected amount of time for each chore on the list. \n\n\tIf you go to the full info page for any of these entries, the expected time for each chore will be shown based on the percentage left. For example, if you put down \"Clean the garage\" with an expected time of 120 minutes, and you already completed 50% of this chore, then the full info page will estimate a time of 60 minutes left for this chore."},
                         @{FAQQuestionTitleKey : @"How does the Practice/Exercise entries work?",
                           FAQAnswerKey : @"\tThe practice/exercise is the only type that will reset after every period. This type is used when you need to do something periodically. For example, if you plan on working out 4 days a week, then every week you will be lead to work out on 4 of the 7 days in the week. But, this doesn't need to be used for working out or practicing a sport, this can also be used if you need to remember to do something every day,week, or month. \n\n\tYou could use it to remember to deposit money in the bank twice a month. Or let's say you add an entry \"sweep the floor\" and you set it to be done weekly, 4 days a week. On the View current entries page, this entry will have 4 checkboxes that will be reset every week. This is also the only type that can not be divided hourly since that would require you do something on individual minutes of every hour. \n\n\tOn the full info page, this is the only type that will show you when each task was completed, so that you don't complete two task at the same time. So basically, you don't double dip."},
                         @{FAQQuestionTitleKey : @"How does the Other entries work?",
                           FAQAnswerKey : @"\tThis type is kind of like a last resort type that is used if none of the other types fit the kind of work you need to be done. When making a new entry or editing an old one, this type is similar to test and project, where it provides a list of things to do with an option to prioritize your list. If you wanted to enter in many task, but didn't want to do it by hand, simply type in '*' followed by a number(WARNING: any other character following the '*' including spaces will not work) into the list of to do's when making or editing the entry."},
                         ],
                 },
             @{
                 FAQSectionKey : @"How Do I...",
                 FAQQuestionsKey : @[
                         @{FAQQuestionTitleKey : @"How do I delete items from the test, other, essay, or project list",
                           FAQAnswerKey : @"\tIf you are using the other, test, project, chores, or essay type, then you will prompted to add items to a list when making a new entry, or editing an old one. In order to delete a certain item on the list, simply click on that item in the list, and the item will highlight blue. Then press the delete button, and the item will be removed. You can delete multiple items at the same time by simply highlighting them first and then pressing the delete button."},
                         @{FAQQuestionTitleKey : @"How do I change the amount of work I did?",
                           FAQAnswerKey : @"\tIf you want to change the amount of work done to a certain entry, go to that entry on the View Current Entries page, find the entry, click on the full info button for that entry, and scroll all the way to the bottom of the page where the \"Change Work Done\" button is located."},
                         @{FAQQuestionTitleKey : @"How do I change the basic information of an entry?",
                           FAQAnswerKey : @"\tIf you want to change the basic information of an entry like the name, due date, due time, and work divide, go to the full info page for that entry, and scroll all the way to the bottom where you will find the \"Edit Information\" button. Click on this button and it will ask if you are sure you want to change the information for this entry. Once you click \"Yes, I'm Sure\", you will be sent to the page where you created the entry with all its basic information already filled in."},
                         @{FAQQuestionTitleKey : @"How do I change the special information of an entry?",
                           FAQAnswerKey : @"\tIf you want to change the special information to a an entry such as the list of a project, or the number of questions to a homework, follow the same steps in the \"What if I want to change the basic information of an entry?\" of the FAQ. In a short explanation, click on the \"Edit Information\" button on the full info page for that entry, and then click on the submit button for the basic information page. This will take you to the special information page for that entry.(For more information go to the \"How do I change the basic information of an entry?\" in the How To section of the FAQ)"},
                         ],
                 },
             @{
                 FAQSectionKey : @"Terms And Definitions",
                 FAQQuestionsKey : @[
                         @{FAQQuestionTitleKey : @"What is the \"work divide\"?",
                           FAQAnswerKey : @"\tWork divide is how you want the work load of a single entry to be divided. You can choose to divide your work hourly, meaning you will have to complete some work every hour, daily, weekly, or monthly. Every entry has its own unique work divide, and they don't have to be the same for the app to work. If hourly, the work load will update every hour, if daily, every day, and so on. \n\n\tBut, in order to use a certain work divide, you need at least two units of time. For example, if you want to divide your work daily, then you need at least 2 days between the current date and the due date. If hourly, you need at least two hours, and so on."},
                         @{FAQQuestionTitleKey : @"What do you mean by period?",
                           FAQAnswerKey : @"\tWhenever period is mentioned, it's referring to the time interval of entries. For example, if you had an entry that was divided hourly, then a period for that entry would be times like 7:00-8:00, 8:00-9:00, and so on. If daily, then the periods would be times like June 5th- June 6th, June 6th-June 7th, and so on. If weekly, the periods start on sunday. If monthly, the periods start on the first day of the month. \n\n\tEntries made in the middle of a period will not affect the functionality of the app, so you don't have to worry about making new entries only on midnight or on Sunday."},
                         ],
                 },
             @{
                 FAQSectionKey : @"What If...",
                 FAQQuestionsKey : @[
                         @{FAQQuestionTitleKey : @"What happens if I skip a period, or don't complete all the work I'm supposed to do?",
                           FAQAnswerKey : @"\tIf you skip a period, then the app will simply recalculate the work that needs to be done. Same applies if you finish a fraction of the work needed to be completed, or if you completed more than  you should have. If you completed a fraction of the work needed for that period, or completed more that you should have, be sure to change the work done on the full information page accordingly. \n\n\tIf you simply didn't do the work for that task (meaning, you didn't check the box on the View Current Entries page), then nothing needs to be done, because the app will recalculate itself."},
                         @{FAQQuestionTitleKey : @"What if I want to do a different amount of work for that period?",
                           FAQAnswerKey : @"\tWhether you wanted to do less of more for that period, you can always do your own amount of work, and change the work done on the full info page of that entry. Be cautious though, because the app divides the work so that you will finish exactly by the due date and time. As a result, constantly doing less work than shown by the app will create more work per period. On the flip side, if you wanted to do more work per period for the whole time, then simply make the due date earlier. \n\n*Note: When you change the work done on the full info page, the work for that period will reset, and still list work to be done."},
                         @{FAQQuestionTitleKey : @"What if I have many tasks to put in when making an entry, but I don't want to type it all in?",
                           FAQAnswerKey : @"\tWhen making or editing a Test, Project, or Other entry, you have the option to create many generic task with a single input. If you type in a '*' followed by a number, then the app will put that many task into the list. For example, if you put in \"*20\" into the test list, then Chapter 1 up to Chapter 20 will be created and put into the list."},
                         @{FAQQuestionTitleKey : @"What if I don't want my entries to be automatically deleted when finished, or what if I want them to be deleted after a certain time?",
                           FAQAnswerKey : @"\tIf you want to change the auto delete trait, or change the default time of entries being deleted after 24 hours, simply click on the settings option on the main screen, and you will be able to either turn the auto delete on or off, and you will be able to set when you want your entries to be deleted if auto delete is on."},
                         ],
                 }
             
             
             ];
}

@end
